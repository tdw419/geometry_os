import socket
import time
import sys

def send_cmd(cmd):
    try:
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect("/tmp/geo_cmd.sock")
        s.sendall((cmd + "\n").encode())
        res = s.recv(4096).decode()
        s.close()
        return res
    except Exception as e:
        return f"Error: {e}"

def get_console():
    return send_cmd("hypervisor_console")

print("Booting VM with display=vnc...")
print(send_cmd("hypervisor_boot arch=riscv64 kernel=/home/jericho/.geometry_os/fs/linux/rv64/Image ram=2048M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=/home/jericho/.geometry_os/vmfs/ubuntu_disk.img"))

print("Waiting 40 seconds for boot...")
for i in range(4):
    time.sleep(10)
    print(f"Waited {10 * (i+1)} seconds...")

print("Logging in as root...")
send_cmd("hypervisor_input root")
time.sleep(3)
send_cmd("hypervisor_input ")
time.sleep(3)

print("Checking framebuffer and dri devices...")
send_cmd("hypervisor_input ls -la /dev/fb* /dev/dri/")
time.sleep(2)
send_cmd("hypervisor_input dmesg | grep -i -E 'drm|virtio_gpu|fb'")
time.sleep(2)

print("Reading full console log...")
print(get_console())
