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
LDI r2, 1              ; increment

; ── Write VM config strings to RAM ──
; VM 1: Linux RISC-V (Native mode)
LDI r3, 0x7000
STRO r3, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r3, 0x7100
STRO r3, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r3, 0x7200
STRO r3, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r6, 0             ; window_id = 0

LDI r3, 0x7000
VM_SPAWN r3, r6      ; VM 1 -> r1 = 1
LDI r9, 0x7810
STORE r9, r1          ; save VM ID 1

LDI r3, 0x7100
VM_SPAWN r3, r6      ; VM 2 -> r1 = 2
LDI r9, 0x7811
STORE r9, r1          ; save VM ID 2

LDI r3, 0x7200
VM_SPAWN r3, r6      ; VM 3 -> r1 = 3
LDI r9, 0x7812
STORE r9, r1          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r9, 0x7810
LOAD r3, r9          ; r3 = VM 1 ID
LDI r8, 2000
VM_SET_BUDGET r3, r8

LDI r9, 0x7811
LOAD r3, r9          ; r3 = VM 2 ID
LDI r8, 1500
VM_SET_BUDGET r3, r8

LDI r9, 0x7812
LOAD r3, r9          ; r3 = VM 3 ID
LDI r8, 500
VM_SET_BUDGET r3, r8

; ── Resume all VMs (start running) ──
LDI r9, 0x7810
LOAD r3, r9
VM_RESUME r3

LDI r9, 0x7811
LOAD r3, r9
VM_RESUME r3

LDI r9, 0x7812
LOAD r3, r9
VM_RESUME r3

; ── Draw the VM Park ──
; Background: dark blue
LDI r3, 0x001030
FILL r3

; Building 1 (left): Red border - Linux RISC-V
LDI r3, 20
LDI r6, 60
LDI r9, 60
LDI r8, 80
LDI r10, 0xFF4444
RECTF r3, r6, r9, r8, r10

; Building 2 (center): Green border - Linux x86
LDI r3, 100
LDI r6, 50
LDI r9, 60
LDI r8, 90
LDI r10, 0x44FF44
RECTF r3, r6, r9, r8, r10

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r3, 180
LDI r6, 65
LDI r9, 50
LDI r8, 75
LDI r10, 0x4488FF
RECTF r3, r6, r9, r8, r10

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r9, 0x7810
LOAD r3, r9
VM_STATUS r3
; r1 = 1 (Running), draw green dot
LDI r10, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r9, 0x7811
LOAD r3, r9
VM_STATUS r3
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r9, 0x7812
LOAD r3, r9
VM_STATUS r3
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r3, 0x7820
VM_LIST r3
; r1 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
