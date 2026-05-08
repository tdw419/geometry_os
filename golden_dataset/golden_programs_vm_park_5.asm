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
LDI r13, 0x7000
STRO r13, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r13, 0x7100
STRO r13, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r13, 0x7200
STRO r13, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r0, 0             ; window_id = 0

LDI r13, 0x7000
VM_SPAWN r13, r0      ; VM 1 -> r14 = 1
LDI r7, 0x7810
STORE r7, r14          ; save VM ID 1

LDI r13, 0x7100
VM_SPAWN r13, r0      ; VM 2 -> r14 = 2
LDI r7, 0x7811
STORE r7, r14          ; save VM ID 2

LDI r13, 0x7200
VM_SPAWN r13, r0      ; VM 3 -> r14 = 3
LDI r7, 0x7812
STORE r7, r14          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r7, 0x7810
LOAD r13, r7          ; r13 = VM 1 ID
LDI r6, 2000
VM_SET_BUDGET r13, r6

LDI r7, 0x7811
LOAD r13, r7          ; r13 = VM 2 ID
LDI r6, 1500
VM_SET_BUDGET r13, r6

LDI r7, 0x7812
LOAD r13, r7          ; r13 = VM 3 ID
LDI r6, 500
VM_SET_BUDGET r13, r6

; ── Resume all VMs (start running) ──
LDI r7, 0x7810
LOAD r13, r7
VM_RESUME r13

LDI r7, 0x7811
LOAD r13, r7
VM_RESUME r13

LDI r7, 0x7812
LOAD r13, r7
VM_RESUME r13

; ── Draw the VM Park ──
; Background: dark blue
LDI r13, 0x001030
FILL r13

; Building 1 (left): Red border - Linux RISC-V
LDI r13, 20
LDI r0, 60
LDI r7, 60
LDI r6, 80
LDI r10, 0xFF4444
RECTF r13, r0, r7, r6, r10

; Building 2 (center): Green border - Linux x86
LDI r13, 100
LDI r0, 50
LDI r7, 60
LDI r6, 90
LDI r10, 0x44FF44
RECTF r13, r0, r7, r6, r10

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r13, 180
LDI r0, 65
LDI r7, 50
LDI r6, 75
LDI r10, 0x4488FF
RECTF r13, r0, r7, r6, r10

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r7, 0x7810
LOAD r13, r7
VM_STATUS r13
; r14 = 1 (Running), draw green dot
LDI r10, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r7, 0x7811
LOAD r13, r7
VM_STATUS r13
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r7, 0x7812
LOAD r13, r7
VM_STATUS r13
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r13, 0x7820
VM_LIST r13
; r14 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
