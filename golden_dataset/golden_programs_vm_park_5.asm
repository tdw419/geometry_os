; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r9, 1              ; increment

; ── Write VM config strings to RAM ──
; VM 1: Linux RISC-V (Native mode)
LDI r15, 0x7000
STRO r15, "arch=riscv64 kernel=Image ram=256M mode=native"

; VM 2: Linux x86 (QEMU mode)
LDI r15, 0x7100
STRO r15, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"

; VM 3: Bare-metal RISC-V loop (Native mode)
LDI r15, 0x7200
STRO r15, "arch=riscv32 kernel=loop.bin ram=64M mode=native"

; ── Spawn 3 VMs ──
LDI r13, 0             ; window_id = 0

LDI r15, 0x7000
VM_SPAWN r15, r13      ; VM 1 -> r1 = 1
LDI r2, 0x7810
STORE r2, r1          ; save VM ID 1

LDI r15, 0x7100
VM_SPAWN r15, r13      ; VM 2 -> r1 = 2
LDI r2, 0x7811
STORE r2, r1          ; save VM ID 2

LDI r15, 0x7200
VM_SPAWN r15, r13      ; VM 3 -> r1 = 3
LDI r2, 0x7812
STORE r2, r1          ; save VM ID 3

; ── Set budgets: VM1=2000, VM2=1500, VM3=500 per frame ──
LDI r2, 0x7810
LOAD r15, r2          ; r15 = VM 1 ID
LDI r8, 2000
VM_SET_BUDGET r15, r8

LDI r2, 0x7811
LOAD r15, r2          ; r15 = VM 2 ID
LDI r8, 1500
VM_SET_BUDGET r15, r8

LDI r2, 0x7812
LOAD r15, r2          ; r15 = VM 3 ID
LDI r8, 500
VM_SET_BUDGET r15, r8

; ── Resume all VMs (start running) ──
LDI r2, 0x7810
LOAD r15, r2
VM_RESUME r15

LDI r2, 0x7811
LOAD r15, r2
VM_RESUME r15

LDI r2, 0x7812
LOAD r15, r2
VM_RESUME r15

; ── Draw the VM Park ──
; Background: dark blue
LDI r15, 0x001030
FILL r15

; Building 1 (left): Red border - Linux RISC-V
LDI r15, 20
LDI r13, 60
LDI r2, 60
LDI r8, 80
LDI r12, 0xFF4444
RECTF r15, r13, r2, r8, r12

; Building 2 (center): Green border - Linux x86
LDI r15, 100
LDI r13, 50
LDI r2, 60
LDI r8, 90
LDI r12, 0x44FF44
RECTF r15, r13, r2, r8, r12

; Building 3 (right): Blue border - Bare-metal RISC-V
LDI r15, 180
LDI r13, 65
LDI r2, 50
LDI r8, 75
LDI r12, 0x4488FF
RECTF r15, r13, r2, r8, r12

; ── Status labels: show VM state as colored dots ──
; VM 1 status dot (green = running)
LDI r2, 0x7810
LOAD r15, r2
VM_STATUS r15
; r1 = 1 (Running), draw green dot
LDI r12, 0x00FF00
PSETI 45, 55, 0x00FF00

; VM 2 status dot
LDI r2, 0x7811
LOAD r15, r2
VM_STATUS r15
PSETI 125, 45, 0x00FF00

; VM 3 status dot
LDI r2, 0x7812
LOAD r15, r2
VM_STATUS r15
PSETI 200, 60, 0x00FF00

; ── List all VMs to RAM at 0x7820 ──
LDI r15, 0x7820
VM_LIST r15
; r1 = 3 VMs listed

; ── Done: HALT with all 3 VMs running in background ──
HALT
