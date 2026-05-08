; DESCRIPTION: Render a colored object at the screen.

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
LDI r10, 1              ; increment

; ── Write VM config strings to RAM ──
; VM 1: Linux RISC-V (Native mode)
LDI r1, 0x7000
STRO r1, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r1, 0x7100
STRO r1, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r1, 0x7200
STRO r1, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r8, 0             ; window_id = 0

LDI r1, 0x7000
VM_SPAWN r1, r8      ; VM 1 -> r5 = 1
LDI r7, 0x7810
STORE r7, r5          ; save VM ID 1

LDI r1, 0x7100
VM_SPAWN r1, r8      ; VM 2 -> r5 = 2
LDI r7, 0x7811
STORE r7, r5          ; save VM ID 2

LDI r1, 0x7200
VM_SPAWN r1, r8      ; VM 3 -> r5 = 3
LDI r7, 0x7812
STORE r7, r5          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r7, 0x7810
LOAD r1, r7          ; r1 = VM 1 ID
LDI r15, 2000
VM_SET_BUDGET r1, r15

LDI r7, 0x7811
LOAD r1, r7          ; r1 = VM 2 ID
LDI r15, 1500
VM_SET_BUDGET r1, r15

LDI r7, 0x7812
LOAD r1, r7          ; r1 = VM 3 ID
LDI r15, 500
VM_SET_BUDGET r1, r15

; ── Resume all VMs (start running) ──
LDI r7, 0x7810
LOAD r1, r7
VM_RESUME r1

LDI r7, 0x7811
LOAD r1, r7
VM_RESUME r1

LDI r7, 0x7812
LOAD r1, r7
VM_RESUME r1

; ── Draw the VM Park ──
; Background: dark blue
LDI r1, 0x001030
FILL r1

; Building 1 (left): Red border - Linux RISC-V
LDI r1, 20
LDI r8, 60
LDI r7, 60
LDI r15, 80
LDI r12, 0xFF4444
RECTF r1, r8, r7, r15, r12

; Building 2 (center): Green border - Linux x86
LDI r1, 100
LDI r8, 50
LDI r7, 60
LDI r15, 90
LDI r12, 0x44FF44
RECTF r1, r8, r7, r15, r12

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r1, 180
LDI r8, 65
LDI r7, 50
LDI r15, 75
LDI r12, 0x4488FF
RECTF r1, r8, r7, r15, r12

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r7, 0x7810
LOAD r1, r7
VM_STATUS r1
; r5 = 1 (Running), draw green dot
LDI r12, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r7, 0x7811
LOAD r1, r7
VM_STATUS r1
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r7, 0x7812
LOAD r1, r7
VM_STATUS r1
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r1, 0x7820
VM_LIST r1
; r5 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
