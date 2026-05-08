; DESCRIPTION: A colored object centered at the screen with fixed size.

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
LDI r12, 0x7000
STRO r12, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r12, 0x7100
STRO r12, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r12, 0x7200
STRO r12, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r7, 0             ; window_id = 0

LDI r12, 0x7000
VM_SPAWN r12, r7      ; VM 1 -> r8 = 1
LDI r13, 0x7810
STORE r13, r8          ; save VM ID 1

LDI r12, 0x7100
VM_SPAWN r12, r7      ; VM 2 -> r8 = 2
LDI r13, 0x7811
STORE r13, r8          ; save VM ID 2

LDI r12, 0x7200
VM_SPAWN r12, r7      ; VM 3 -> r8 = 3
LDI r13, 0x7812
STORE r13, r8          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r13, 0x7810
LOAD r12, r13          ; r12 = VM 1 ID
LDI r3, 2000
VM_SET_BUDGET r12, r3

LDI r13, 0x7811
LOAD r12, r13          ; r12 = VM 2 ID
LDI r3, 1500
VM_SET_BUDGET r12, r3

LDI r13, 0x7812
LOAD r12, r13          ; r12 = VM 3 ID
LDI r3, 500
VM_SET_BUDGET r12, r3

; ── Resume all VMs (start running) ──
LDI r13, 0x7810
LOAD r12, r13
VM_RESUME r12

LDI r13, 0x7811
LOAD r12, r13
VM_RESUME r12

LDI r13, 0x7812
LOAD r12, r13
VM_RESUME r12

; ── Draw the VM Park ──
; Background: dark blue
LDI r12, 0x001030
FILL r12

; Building 1 (left): Red border - Linux RISC-V
LDI r12, 20
LDI r7, 60
LDI r13, 60
LDI r3, 80
LDI r6, 0xFF4444
RECTF r12, r7, r13, r3, r6

; Building 2 (center): Green border - Linux x86
LDI r12, 100
LDI r7, 50
LDI r13, 60
LDI r3, 90
LDI r6, 0x44FF44
RECTF r12, r7, r13, r3, r6

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r12, 180
LDI r7, 65
LDI r13, 50
LDI r3, 75
LDI r6, 0x4488FF
RECTF r12, r7, r13, r3, r6

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r13, 0x7810
LOAD r12, r13
VM_STATUS r12
; r8 = 1 (Running), draw green dot
LDI r6, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r13, 0x7811
LOAD r12, r13
VM_STATUS r12
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r13, 0x7812
LOAD r12, r13
VM_STATUS r12
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r12, 0x7820
VM_LIST r12
; r8 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
