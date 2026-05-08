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
LDI r3, 0x000033   ; dark blue
LDI r7, 0
LDI r8, 0
LDI r1, 256
LDI r0, 16
RECTF r7, r8, r1, r0, r3

; Title text
LDI r5, 0x3000
STRO r5, "Alpine Linux Live Tile"
LDI r9, 3
LDI r16, 4
TEXT r9, r16, r5

; Status text
LDI r5, 0x3100
STRO r5, "Use: hypervisor_boot"
LDI r9, 2
LDI r16, 20
TEXT r9, r16, r5

LDI r5, 0x3200
STRO r5, "Status: hypervisor_status"
LDI r9, 2
LDI r16, 28
TEXT r9, r16, r5

; Draw a frame around the terminal area
LDI r3, 0x00FF00   ; green frame
LDI r7, 0
LDI r8, 16
LDI r1, 256
LDI r0, 1
RECTF r7, r8, r1, r0, r3  ; top border
LDI r8, 255
RECTF r7, r8, r1, r0, r3  ; bottom border
LDI r7, 0
LDI r8, 16
LDI r1, 1
LDI r0, 240
RECTF r7, r8, r1, r0, r3  ; left border
LDI r7, 255
RECTF r7, r8, r1, r0, r3  ; right border

HALT
