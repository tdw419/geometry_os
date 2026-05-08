; DESCRIPTION: This GeOS assembly code initializes a display with a dark blue title bar labeled "Alpine Linux Live Tile" and green borders around the terminal area. It provides usage instructions for hypervisor commands such as `hypervisor_boot`, `hypervisor_status`, and others, rendered in text at specific coordinates on the screen.

; alpine_tile.asm -- Alpine Linux Live Tile (Phase 123)
;
; This program displays a title bar for the Alpine Linux live tile.
; When the hypervisor is booted (via hypervisor_boot socket command),
; the RISC-V VM output is rendered onto the screen in real-time.
;
; Usage from socket:
;   hypervisor_boot                     (use defaults)
;   hypervisor_boot ram=256             (custom RAM)
;   inject_key h                        (send 'h' to guest shell)
;   hypervisor_status                   (check status)
;   hypervisor_kill                     (clean up)

; Title bar
LDI r10, 0x000033   ; dark blue
LDI r14, 0
LDI r8, 0
LDI r5, 256
LDI r0, 16
RECTF r14, r8, r5, r0, r10

; Title text
LDI r15, 0x3000
STRO r15, "Alpine Linux Live Tile"
LDI r13, 3
LDI r16, 4
TEXT r13, r16, r15

; Status text
LDI r15, 0x3100
STRO r15, "Use: hypervisor_boot"
LDI r13, 2
LDI r16, 20
TEXT r13, r16, r15

LDI r15, 0x3200
STRO r15, "Status: hypervisor_status"
LDI r13, 2
LDI r16, 28
TEXT r13, r16, r15

; Draw a frame around the terminal area
LDI r10, 0x00FF00   ; green frame
LDI r14, 0
LDI r8, 16
LDI r5, 256
LDI r0, 1
RECTF r14, r8, r5, r0, r10  ; top border
LDI r8, 255
RECTF r14, r8, r5, r0, r10  ; bottom border
LDI r14, 0
LDI r8, 16
LDI r5, 1
LDI r0, 240
RECTF r14, r8, r5, r0, r10  ; left border
LDI r14, 255
RECTF r14, r8, r5, r0, r10  ; right border

HALT
