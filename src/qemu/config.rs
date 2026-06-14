// qemu/config.rs -- QEMU configuration parsing and command building
//
// Parses a config string like "arch=riscv64 kernel=linux.img ram=256M"
// and builds the corresponding QEMU Command.

use std::process::{Command, Stdio};

// ── Architecture mapping ─────────────────────────────────────────

/// Maps a config arch string to (qemu_binary, machine_flag).
/// Returns None for unknown architectures.
pub fn arch_to_qemu(arch: &str) -> Option<(&'static str, Option<&'static str>)> {
    match arch {
        "riscv64" => Some(("qemu-system-riscv64", Some("-machine virt"))),
        "riscv32" => Some(("qemu-system-riscv32", Some("-machine virt"))),
        "x86_64" => Some(("qemu-system-x86_64", None)),
        "aarch64" => Some(("qemu-system-aarch64", Some("-machine virt"))),
        "arm" => Some(("qemu-system-arm", Some("-machine virt"))),
        "mipsel" => Some(("qemu-system-mipsel", Some("-machine malta"))),
        "mips" => Some(("qemu-system-mips", Some("-machine malta"))),
        "ppc" => Some(("qemu-system-ppc", None)),
        "ppc64" => Some(("qemu-system-ppc64", None)),
        "s390x" => Some(("qemu-system-s390x", None)),
        _ => None,
    }
}

// ── QEMU Config ──────────────────────────────────────────────────

/// Parsed QEMU configuration from a config string.
/// Format: "arch=riscv64 kernel=linux.img ram=256M disk=rootfs.ext4"
#[derive(Debug, Clone, Default)]
pub struct QemuConfig {
    pub arch: String,
    pub kernel: Option<String>,
    pub ram: Option<String>,
    pub disk: Option<String>,
    pub bios: Option<String>,
    pub initrd: Option<String>,
    pub append: Option<String>,
    pub net: Option<String>,
    pub trace: Option<String>,
    /// Display mode: "serial" (default, -nographic), "vnc" (-display vnc), or "none" (-display none)
    pub display: String,
    /// VNC display port, e.g. ":0" maps to port 5900. Only used when display="vnc".
    pub vnc_port: Option<String>,
    pub extra_args: Vec<String>,
}

impl QemuConfig {
    /// Parse a config string into a QemuConfig.
    /// Format: "key=value key=value ..."
    /// Unknown keys are stored in extra_args.
    pub fn parse(config_str: &str) -> Result<QemuConfig, String> {
        let mut cfg = QemuConfig::default();
        for token in config_str.split_whitespace() {
            let parts: Vec<&str> = token.splitn(2, '=').collect();
            if parts.len() != 2 || parts[1].is_empty() {
                return Err(format!(
                    "invalid config token: '{}' (expected key=value)",
                    token
                ));
            }
            let key = parts[0].to_lowercase();
            let val = parts[1].to_string();
            match key.as_str() {
                "arch" => cfg.arch = val,
                "kernel" => cfg.kernel = Some(val),
                "ram" | "memory" | "m" => cfg.ram = Some(val),
                "disk" | "drive" | "hda" => cfg.disk = Some(val),
                "bios" => cfg.bios = Some(val),
                "initrd" => cfg.initrd = Some(val),
                "append" | "cmdline" => {
                    // Append can accumulate multiple kernel params
                    if let Some(ref mut existing) = cfg.append {
                        existing.push(' ');
                        existing.push_str(&val);
                    } else {
                        cfg.append = Some(val);
                    }
                },
                "root" | "init" => {
                    // root= / init= are kernel params, merge into append
                    if let Some(ref mut append) = cfg.append {
                        append.push_str(&format!(" {}={}", key, val));
                    } else {
                        cfg.append = Some(format!("{}={}", key, val));
                    }
                },
                "net" | "nic" => cfg.net = Some(val),
                "trace" => cfg.trace = Some(val),
                "display" => {
                    let mode = val.to_lowercase();
                    match mode.as_str() {
                        "serial" | "vnc" | "none" => cfg.display = mode,
                        _ => {
                            return Err(format!(
                                "invalid display mode: '{}' (expected serial, vnc, or none)",
                                val
                            ));
                        },
                    }
                },
                "vnc" => {
                    // Accept formats: :0, :1, localhost:5900, 5900
                    if val.starts_with(':') {
                        cfg.vnc_port = Some(val);
                    } else if let Ok(port) = val.parse::<u16>() {
                        // Convert absolute port to VNC display number
                        let display_num = port.saturating_sub(5900);
                        cfg.vnc_port = Some(format!(":{}", display_num));
                    } else {
                        cfg.vnc_port = Some(val);
                    }
                },
                _ => cfg.extra_args.push(token.to_string()),
            }
        }
        if cfg.arch.is_empty() {
            return Err("config must specify arch=<architecture>".into());
        }
        Ok(cfg)
    }

    /// Build the QEMU command from this config.
    pub fn build_command(&self) -> Result<Command, String> {
        let (binary, machine) = arch_to_qemu(&self.arch)
            .ok_or_else(|| format!("unknown architecture: '{}'", self.arch))?;

        let mut cmd = Command::new(binary);
        cmd.stdin(Stdio::piped())
            .stdout(Stdio::piped())
            .stderr(Stdio::inherit()); // Merge stderr to parent for visibility

        // Display mode
        match self.display.as_str() {
            "serial" | "" => {
                // Default: headless serial console via stdio
                cmd.arg("-nographic");
                cmd.arg("-serial").arg("mon:stdio");
            },
            "vnc" => {
                // VNC display with virtio GPU for graphical output
                let vnc_arg = self
                    .vnc_port
                    .as_deref()
                    .map(|p| format!("vnc={}", p))
                    .unwrap_or_else(|| "vnc=:0".to_string());
                cmd.args(["-display", &vnc_arg]);
                // Use virtio-gpu-pci for virt machine (RISC-V uses PCI bus)
                cmd.args(["-device", "virtio-gpu-pci"]);
                // Add virtio keyboard for VNC input
                cmd.args(["-device", "virtio-keyboard-pci"]);
                // Add virtio mouse and tablet for VNC pointer input
                cmd.args(["-device", "virtio-mouse-pci"]);
                cmd.args(["-device", "virtio-tablet-pci"]);
                // Keep serial available for console fallback
                cmd.arg("-serial").arg("mon:stdio");
            },
            "none" => {
                // No display, but keep serial for console output
                cmd.arg("-display").arg("none");
                cmd.arg("-serial").arg("mon:stdio");
            },
            _ => {
                // Fallback to serial for safety
                cmd.arg("-nographic");
                cmd.arg("-serial").arg("mon:stdio");
            },
        }

        // Machine type
        if let Some(m) = machine {
            let parts: Vec<&str> = m.split_whitespace().collect();
            for p in parts {
                cmd.arg(p);
            }
        }

        // RAM
        if let Some(ref ram) = self.ram {
            cmd.arg("-m").arg(ram);
        }

        // Kernel
        if let Some(ref kernel) = self.kernel {
            cmd.arg("-kernel").arg(kernel);
        }

        // BIOS
        if let Some(ref bios) = self.bios {
            cmd.arg("-bios").arg(bios);
        }

        // Initrd
        if let Some(ref initrd) = self.initrd {
            cmd.arg("-initrd").arg(initrd);
        }

        // Kernel command line
        if let Some(ref append) = self.append {
            cmd.arg("-append").arg(append);
        } else if self.display == "serial" || self.display.is_empty() {
            // Default kernel command line for serial console
            cmd.arg("-append").arg("console=ttyS0");
        }
        // For VNC/none display modes, no default append — let guest OS use graphical console

        // Disk
        if let Some(ref disk) = self.disk {
            cmd.args(["-drive", &format!("file={},format=raw,if=virtio", disk)]);
        }

        // Network
        if let Some(ref net) = self.net {
            if net == "none" {
                cmd.arg("-net").arg("none");
            } else if net.starts_with("user") {
                // net=user or net=user,hostfwd=... — already starts with "user"
                let netdev_arg = format!("{},id=net0", net);
                cmd.args(["-netdev", &netdev_arg]);
                cmd.args(["-device", "virtio-net-device,netdev=net0"]);
            } else {
                // Custom netdev params (e.g. "tap,ifname=tap0")
                let netdev_arg = format!("{},id=net0", net);
                cmd.args(["-netdev", &netdev_arg]);
                cmd.args(["-device", "virtio-net-device,netdev=net0"]);
            }
        }

        // Trace/debug: trace=int enables interrupt/exception logging
        if let Some(ref trace) = self.trace {
            let log_path = std::env::temp_dir().join("geo_qemu_trace.log");
            match trace.as_str() {
                "int" | "interrupts" => {
                    cmd.arg("-d").arg("int");
                    cmd.arg("-D").arg(&log_path);
                },
                "in_asm" | "asm" => {
                    cmd.arg("-d").arg("in_asm");
                    cmd.arg("-D").arg(&log_path);
                },
                "exec" => {
                    cmd.arg("-d").arg("exec");
                    cmd.arg("-D").arg(&log_path);
                },
                "cpu" => {
                    cmd.arg("-d").arg("cpu");
                    cmd.arg("-D").arg(&log_path);
                },
                _ => {
                    // Pass through as -d <val>
                    cmd.arg("-d").arg(trace);
                    cmd.arg("-D").arg(&log_path);
                },
            }
        }

        // Extra args
        for arg in &self.extra_args {
            cmd.arg(arg);
        }

        Ok(cmd)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_config_parse_minimal() {
        let cfg = QemuConfig::parse("arch=riscv64").expect("config parse should succeed");
        assert_eq!(cfg.arch, "riscv64");
        assert!(cfg.kernel.is_none());
        assert!(cfg.ram.is_none());
    }

    #[test]
    fn test_config_parse_full() {
        let cfg = QemuConfig::parse("arch=x86_64 kernel=bzImage ram=512M disk=rootfs.ext4")
            .expect("operation should succeed");
        assert_eq!(cfg.arch, "x86_64");
        assert_eq!(cfg.kernel.as_deref(), Some("bzImage"));
        assert_eq!(cfg.ram.as_deref(), Some("512M"));
        assert_eq!(cfg.disk.as_deref(), Some("rootfs.ext4"));
    }

    #[test]
    fn test_config_parse_memory_alias() {
        let cfg = QemuConfig::parse("arch=aarch64 memory=1G").expect("config parse should succeed");
        assert_eq!(cfg.ram.as_deref(), Some("1G"));
    }

    #[test]
    fn test_config_parse_initrd_append() {
        let cfg = QemuConfig::parse(
            "arch=riscv64 kernel=Image initrd=initramfs.cpio.gz append=root=/dev/vda",
        )
        .expect("operation should succeed");
        assert_eq!(cfg.initrd.as_deref(), Some("initramfs.cpio.gz"));
        assert_eq!(cfg.append.as_deref(), Some("root=/dev/vda"));
    }

    #[test]
    fn test_config_parse_no_arch() {
        let result = QemuConfig::parse("kernel=linux.img");
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("arch"));
    }

    #[test]
    fn test_config_parse_invalid_token() {
        let result = QemuConfig::parse("arch=riscv64 nogoodvalue");
        assert!(result.is_err());
    }

    #[test]
    fn test_config_parse_extra_args() {
        let cfg =
            QemuConfig::parse("arch=riscv64 custom=foo").expect("config parse should succeed");
        assert_eq!(cfg.extra_args, vec!["custom=foo"]);
    }

    #[test]
    fn test_arch_mapping_riscv64() {
        let (bin, machine) = arch_to_qemu("riscv64").expect("arch should be supported");
        assert_eq!(bin, "qemu-system-riscv64");
        assert_eq!(machine, Some("-machine virt"));
    }

    #[test]
    fn test_arch_mapping_x86_64() {
        let (bin, machine) = arch_to_qemu("x86_64").expect("arch should be supported");
        assert_eq!(bin, "qemu-system-x86_64");
        assert!(machine.is_none());
    }

    #[test]
    fn test_arch_mapping_aarch64() {
        let (bin, machine) = arch_to_qemu("aarch64").expect("arch should be supported");
        assert_eq!(bin, "qemu-system-aarch64");
        assert_eq!(machine, Some("-machine virt"));
    }

    #[test]
    fn test_arch_mapping_mipsel() {
        let (bin, machine) = arch_to_qemu("mipsel").expect("arch should be supported");
        assert_eq!(bin, "qemu-system-mipsel");
        assert_eq!(machine, Some("-machine malta"));
    }

    #[test]
    fn test_arch_mapping_unknown() {
        assert!(arch_to_qemu("nonexistent").is_none());
    }

    #[test]
    fn test_build_command_riscv64() {
        let cfg = QemuConfig::parse("arch=riscv64 kernel=Image ram=256M")
            .expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"-nographic".to_string()));
        assert!(args.contains(&"mon:stdio".to_string()));
        assert!(args.contains(&"-machine".to_string()));
        assert!(args.contains(&"virt".to_string()));
        assert!(args.contains(&"-m".to_string()));
        assert!(args.contains(&"256M".to_string()));
        assert!(args.contains(&"-kernel".to_string()));
        assert!(args.contains(&"Image".to_string()));
    }

    #[test]
    fn test_build_command_with_disk() {
        let cfg = QemuConfig::parse("arch=riscv64 disk=rootfs.ext4")
            .expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        let drive_arg = args
            .iter()
            .find(|a| a.contains("rootfs.ext4"))
            .expect("expected element should exist");
        assert!(drive_arg.contains("format=raw"));
        assert!(drive_arg.contains("if=virtio"));
    }

    #[test]
    fn test_build_command_with_net_none() {
        let cfg = QemuConfig::parse("arch=riscv64 net=none").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"none".to_string()));
    }

    #[test]
    fn test_build_command_unknown_arch() {
        let cfg = QemuConfig::parse("arch=invalid_cpu").expect("config parse should succeed");
        assert!(cfg.build_command().is_err());
    }

    #[test]
    fn test_config_parse_display_vnc() {
        let cfg =
            QemuConfig::parse("arch=x86_64 display=vnc").expect("config parse should succeed");
        assert_eq!(cfg.display, "vnc");
        assert_eq!(cfg.vnc_port, None);
    }

    #[test]
    fn test_config_parse_display_vnc_with_port() {
        let cfg = QemuConfig::parse("arch=x86_64 display=vnc vnc=:1")
            .expect("config parse should succeed");
        assert_eq!(cfg.display, "vnc");
        assert_eq!(cfg.vnc_port, Some(":1".to_string()));
    }

    #[test]
    fn test_config_parse_display_vnc_with_absolute_port() {
        let cfg = QemuConfig::parse("arch=x86_64 display=vnc vnc=5902")
            .expect("config parse should succeed");
        assert_eq!(cfg.display, "vnc");
        assert_eq!(cfg.vnc_port, Some(":2".to_string()));
    }

    #[test]
    fn test_config_parse_display_serial() {
        let cfg =
            QemuConfig::parse("arch=x86_64 display=serial").expect("config parse should succeed");
        assert_eq!(cfg.display, "serial");
    }

    #[test]
    fn test_config_parse_display_none() {
        let cfg =
            QemuConfig::parse("arch=x86_64 display=none").expect("config parse should succeed");
        assert_eq!(cfg.display, "none");
    }

    #[test]
    fn test_config_parse_display_invalid() {
        let result = QemuConfig::parse("arch=x86_64 display=hdmi");
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("invalid display mode"));
    }

    #[test]
    fn test_build_command_vnc_display() {
        let cfg = QemuConfig::parse("arch=x86_64 display=vnc vnc=:0")
            .expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"-display".to_string()));
        assert!(args.contains(&"vnc=:0".to_string()));
        assert!(args.contains(&"-device".to_string()));
        assert!(args.contains(&"virtio-gpu-pci".to_string()));
        // Should NOT have -nographic
        assert!(!args.contains(&"-nographic".to_string()));
    }

    #[test]
    fn test_build_command_vnc_default_port() {
        let cfg =
            QemuConfig::parse("arch=x86_64 display=vnc").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"vnc=:0".to_string()));
    }

    #[test]
    fn test_build_command_display_none() {
        let cfg =
            QemuConfig::parse("arch=x86_64 display=none").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"-display".to_string()));
        assert!(args.contains(&"none".to_string()));
        assert!(!args.contains(&"-nographic".to_string()));
    }

    #[test]
    fn test_build_command_serial_default() {
        // Default (no display specified) should use -nographic
        let cfg = QemuConfig::parse("arch=x86_64").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"-nographic".to_string()));
    }

    #[test]
    fn test_build_command_vnc_no_default_append() {
        // VNC mode should not add console=ttyS0 by default
        let cfg =
            QemuConfig::parse("arch=x86_64 display=vnc").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(!args.contains(&"console=ttyS0".to_string()));
    }

    #[test]
    fn test_build_command_serial_has_default_append() {
        // Serial mode should add console=ttyS0 by default
        let cfg = QemuConfig::parse("arch=x86_64").expect("config parse should succeed");
        let cmd = cfg.build_command().expect("command build should succeed");
        let args: Vec<String> = cmd.get_args().map(|s| s.to_string_lossy().into()).collect();
        assert!(args.contains(&"console=ttyS0".to_string()));
    }
}
