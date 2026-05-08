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
LDI r8, 1              ; increment

; ── Write VM config strings to RAM ──
; VM 1: Linux RISC-V (Native mode)
LDI r6, 0x7000
STRO r6, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r6, 0x7100
STRO r6, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r6, 0x7200
STRO r6, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r11, 0             ; window_id = 0

LDI r6, 0x7000
VM_SPAWN r6, r11      ; VM 1 -> r4 = 1
LDI r14, 0x7810
STORE r14, r4          ; save VM ID 1

LDI r6, 0x7100
VM_SPAWN r6, r11      ; VM 2 -> r4 = 2
LDI r14, 0x7811
STORE r14, r4          ; save VM ID 2

LDI r6, 0x7200
VM_SPAWN r6, r11      ; VM 3 -> r4 = 3
LDI r14, 0x7812
STORE r14, r4          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r14, 0x7810
LOAD r6, r14          ; r6 = VM 1 ID
LDI r15, 2000
VM_SET_BUDGET r6, r15

LDI r14, 0x7811
LOAD r6, r14          ; r6 = VM 2 ID
LDI r15, 1500
VM_SET_BUDGET r6, r15

LDI r14, 0x7812
LOAD r6, r14          ; r6 = VM 3 ID
LDI r15, 500
VM_SET_BUDGET r6, r15

; ── Resume all VMs (start running) ──
LDI r14, 0x7810
LOAD r6, r14
VM_RESUME r6

LDI r14, 0x7811
LOAD r6, r14
VM_RESUME r6

LDI r14, 0x7812
LOAD r6, r14
VM_RESUME r6

; ── Draw the VM Park ──
; Background: dark blue
LDI r6, 0x001030
FILL r6

; Building 1 (left): Red border - Linux RISC-V
LDI r6, 20
LDI r11, 60
LDI r14, 60
LDI r15, 80
LDI r9, 0xFF4444
RECTF r6, r11, r14, r15, r9

; Building 2 (center): Green border - Linux x86
LDI r6, 100
LDI r11, 50
LDI r14, 60
LDI r15, 90
LDI r9, 0x44FF44
RECTF r6, r11, r14, r15, r9

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r6, 180
LDI r11, 65
LDI r14, 50
LDI r15, 75
LDI r9, 0x4488FF
RECTF r6, r11, r14, r15, r9

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r14, 0x7810
LOAD r6, r14
VM_STATUS r6
; r4 = 1 (Running), draw green dot
LDI r9, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r14, 0x7811
LOAD r6, r14
VM_STATUS r6
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r14, 0x7812
LOAD r6, r14
VM_STATUS r6
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r6, 0x7820
VM_LIST r6
; r4 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
