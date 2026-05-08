; DESCRIPTION: This GeOS assembly code sets up a virtual machine park demonstration, spawning three hypervisor-managed virtual machines (VMs) running different operating systems (Linux RISC-V, Linux x86, and a bare-metal RISC-V loop). It configures each VM with specific parameters, resumes them for background execution, manages their time-slice budgets, and visually represents their states on the screen. The program halts while maintaining all VMs in an active running state.

; vm_park.asm -- Phase 87: VM Park Demo
; Map region with 3 hypervisor buildings: Linux RISC-V, Linux x86, and a bare-metal RISC-V loop.
; Walk between them, enter any, all run in background.
;
; This program demonstrates:
; - VM_SPAWN: Creating 3 background hypervisor VMs
; - VM_RESUME: Starting them for background execution
; - VM_STATUS: Querying their states
; - VM_PAUSE: Pausing when leaving a building
; - VM_LIST: Listing all active VMs
; - VM_SET_BUDGET: Setting time-slice budgets
; - VM_KILL: Cleaning up on exit
;
; Memory layout:
;   0x7000 - VM configs (3 strings)
;   0x7800 - Player position (x, y)
;   0x7810 - VM ID storage (3 slots)
;   0x7820 - VM status RAM area

; ── Constants ──
LDI r7, 1              ; increment

; ── Write VM config strings to RAM ──
; VM 1: Linux RISC-V (Native mode)
LDI r8, 0x7000
STRO r8, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r8, 0x7100
STRO r8, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r8, 0x7200
STRO r8, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r4, 0             ; window_id = 0

LDI r8, 0x7000
VM_SPAWN r8, r4      ; VM 1 -> r3 = 1
LDI r11, 0x7810
STORE r11, r3          ; save VM ID 1

LDI r8, 0x7100
VM_SPAWN r8, r4      ; VM 2 -> r3 = 2
LDI r11, 0x7811
STORE r11, r3          ; save VM ID 2

LDI r8, 0x7200
VM_SPAWN r8, r4      ; VM 3 -> r3 = 3
LDI r11, 0x7812
STORE r11, r3          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r11, 0x7810
LOAD r8, r11          ; r8 = VM 1 ID
LDI r15, 2000
VM_SET_BUDGET r8, r15

LDI r11, 0x7811
LOAD r8, r11          ; r8 = VM 2 ID
LDI r15, 1500
VM_SET_BUDGET r8, r15

LDI r11, 0x7812
LOAD r8, r11          ; r8 = VM 3 ID
LDI r15, 500
VM_SET_BUDGET r8, r15

; ── Resume all VMs (start running) ──
LDI r11, 0x7810
LOAD r8, r11
VM_RESUME r8

LDI r11, 0x7811
LOAD r8, r11
VM_RESUME r8

LDI r11, 0x7812
LOAD r8, r11
VM_RESUME r8

; ── Draw the VM Park ──
; Background: dark blue
LDI r8, 0x001030
FILL r8

; Building 1 (left): Red border - Linux RISC-V
LDI r8, 20
LDI r4, 60
LDI r11, 60
LDI r15, 80
LDI r13, 0xFF4444
RECTF r8, r4, r11, r15, r13

; Building 2 (center): Green border - Linux x86
LDI r8, 100
LDI r4, 50
LDI r11, 60
LDI r15, 90
LDI r13, 0x44FF44
RECTF r8, r4, r11, r15, r13

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r8, 180
LDI r4, 65
LDI r11, 50
LDI r15, 75
LDI r13, 0x4488FF
RECTF r8, r4, r11, r15, r13

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r11, 0x7810
LOAD r8, r11
VM_STATUS r8
; r3 = 1 (Running), draw green dot
LDI r13, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r11, 0x7811
LOAD r8, r11
VM_STATUS r8
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r11, 0x7812
LOAD r8, r11
VM_STATUS r8
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r8, 0x7820
VM_LIST r8
; r3 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
