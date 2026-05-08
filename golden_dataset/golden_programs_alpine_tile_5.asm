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
LDI r4, 0x000033   ; dark blue
LDI r10, 0
LDI r13, 0
LDI r5, 256
LDI r2, 16
RECTF r10, r13, r5, r2, r4

; Title text
LDI r8, 0x3000
STRO r8, "Alpine Linux Live Tile"
LDI r7, 3
LDI r16, 4
TEXT r7, r16, r8

; Status text
LDI r8, 0x3100
STRO r8, "Use: hypervisor_boot"
LDI r7, 2
LDI r16, 20
TEXT r7, r16, r8

LDI r8, 0x3200
STRO r8, "Status: hypervisor_status"
LDI r7, 2
LDI r16, 28
TEXT r7, r16, r8

; Draw a frame around the terminal area
LDI r4, 0x00FF00   ; green frame
LDI r10, 0
LDI r13, 16
LDI r5, 256
LDI r2, 1
RECTF r10, r13, r5, r2, r4  ; top border
LDI r13, 255
RECTF r10, r13, r5, r2, r4  ; bottom border
LDI r10, 0
LDI r13, 16
LDI r5, 1
LDI r2, 240
RECTF r10, r13, r5, r2, r4  ; left border
LDI r10, 255
RECTF r10, r13, r5, r2, r4  ; right border

HALT
