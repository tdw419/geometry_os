#!/usr/bin/env python3
"""
Palace Boot — boot configuration stored in the Memory Palace.
The palace facts index stores all boot parameters (kernel path,
disk path, root UUID, mem, cpus, append args). The boot script
reads from the palace instead of hardcoding values.

Usage:
  python3 palace_boot.py register   — register current boot config in palace
  python3 palace_boot.py show        — show boot config from palace
  python3 palace_boot.py qemu-cmd    — generate the QEMU command line
  python3 palace_boot.py update <key> <value> — update a boot param
"""
import json, sys, os, subprocess
from pathlib import Path

FACTS_FILE = Path(__file__).parent / "memory_palace_facts.json"

def load():
    if FACTS_FILE.exists():
        with open(FACTS_FILE) as f:
            return json.load(f)
    return {"version": 1, "facts": []}

def save(data):
    import datetime
    data["last_updated"] = datetime.datetime.now().isoformat()
    with open(FACTS_FILE, "w") as f:
        json.dump(data, f, indent=2)

# Boot params are stored as a special fact with source="boot-config"
# The content is a JSON blob with all boot parameters
BOOT_SUBJECT = "boot-config"
BOOT_DEFAULTS = {
    "kernel": "/home/jericho/projects/zion/projects/pixel-linux/qcow2_test_kernel",
    "initramfs": "/home/jericho/projects/zion/projects/pixel-linux/qcow2_test_initramfs.img",
    "disk": "/home/jericho/projects/zion/projects/geometry_os/geometry_os_original/apps/linux/ubuntu-24.04-desktop.qcow2",
    "root_uuid": "eaaf9de6-0dfb-43be-ae29-56f2742523e8",
    "append": "root=UUID=eaaf9de6-0dfb-43be-ae29-56f2742523e8 ro console=ttyS0,115200 plymouth.enable=0 systemd.show_status=false",
    "memory": "4G",
    "cpus": 2,
    "ssh_port": 2222,
    "vnc_display": ":0",
}

def get_boot_config():
    data = load()
    for f in data["facts"]:
        if f.get("subject") == BOOT_SUBJECT:
            try:
                return {**BOOT_DEFAULTS, **json.loads(f["content"])}
            except:
                return dict(BOOT_DEFAULTS)
    return dict(BOOT_DEFAULTS)

def save_boot_config(config):
    data = load()
    # Remove old boot config facts
    data["facts"] = [f for f in data["facts"] if f.get("subject") != BOOT_SUBJECT]
    # Add new one
    max_id = max([f["id"] for f in data["facts"]], default=0)
    data["facts"].append({
        "id": max_id + 1,
        "tier": "critical",
        "subject": BOOT_SUBJECT,
        "content": json.dumps(config, indent=2),
        "source": "palace-boot",
        "ring": 0, "angle": 0,
    })
    save(data)

def cmd_register():
    """Register the ACTUAL current boot state (auto-detected from running QEMU)"""
    config = dict(BOOT_DEFAULTS)
    # Try to detect from running QEMU process
    try:
        qemu_proc = subprocess.run(
            ["ps", "aux"], capture_output=True, text=True, timeout=5
        )
        for line in qemu_proc.stdout.split("\n"):
            if "qemu-system-x86_64" in line and "qcow2_test_kernel" in line:
                if "-m " in line:
                    m = line.split("-m ")[1].split()[0]
                    config["memory"] = m
                if "-smp " in line:
                    m = line.split("-smp ")[1].split()[0]
                    config["cpus"] = int(m)
                if "hostfwd=tcp::" in line:
                    m = line.split("hostfwd=tcp::")[1].split("-")[0]
                    config["ssh_port"] = int(m)
                if "-vnc " in line:
                    m = line.split("-vnc ")[1].split()[0]
                    config["vnc_display"] = m
                break
    except: pass
    save_boot_config(config)
    print("✓ Boot config registered in Memory Palace")
    cmd_show()

def cmd_show():
    cfg = get_boot_config()
    for k, v in cfg.items():
        print(f"  {k:15} = {v}")

def cmd_qemu():
    cfg = get_boot_config()
    # Verify files exist
    for key in ["kernel", "initramfs", "disk"]:
        p = Path(cfg[key])
        if not p.exists():
            print(f"⚠  {key} not found: {cfg[key]}", file=sys.stderr)
    # Build QEMU command
    cmd = [
        "qemu-system-x86_64",
        "-kernel", cfg["kernel"],
        "-initrd", cfg["initramfs"],
        "-append", cfg["append"],
        "-drive", f"file={cfg['disk']},format=qcow2,if=virtio",
        "-m", cfg["memory"],
        "-smp", str(cfg["cpus"]),
        "-display", f"vnc={cfg['vnc_display']}",
        "-enable-kvm",
        "-cpu", "host",
        "-netdev", f"user,id=net0,hostfwd=tcp::2222-:22",
        "-device", "virtio-net,netdev=net0",
        "-virtfs", f"local,path=/home/jericho/zion/projects,security_model=mapped,mount_tag=projects",
        "-nographic",
        "-no-reboot",
    ]
    print(" ".join(cmd))

def cmd_update(key, value):
    cfg = get_boot_config()
    if key not in cfg:
        print(f"Unknown key: {key}. Valid: {', '.join(cfg.keys())}")
        sys.exit(1)
    # Type coercion
    if key == "cpus":
        value = int(value)
    cfg[key] = value
    save_boot_config(cfg)
    print(f"✓ {key} = {value}")
    cmd_show()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__); sys.exit(1)
    cmd = sys.argv[1]
    if cmd == "register": cmd_register()
    elif cmd == "show": cmd_show()
    elif cmd == "qemu-cmd": cmd_qemu()
    elif cmd == "update" and len(sys.argv) >= 4: cmd_update(sys.argv[2], sys.argv[3])
    else: print(__doc__)
