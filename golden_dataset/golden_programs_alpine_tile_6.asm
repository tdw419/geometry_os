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
LDI r11, 0x000033   ; dark blue
LDI r7, 0
LDI r12, 0
LDI r8, 256
LDI r6, 16
RECTF r7, r12, r8, r6, r11

; Title text
LDI r2, 0x3000
STRO r2, "Alpine Linux Live Tile"
LDI r0, 3
LDI r16, 4
TEXT r0, r16, r2

; Status text
LDI r2, 0x3100
STRO r2, "Use: hypervisor_boot"
LDI r0, 2
LDI r16, 20
TEXT r0, r16, r2

LDI r2, 0x3200
STRO r2, "Status: hypervisor_status"
LDI r0, 2
LDI r16, 28
TEXT r0, r16, r2

; Draw a frame around the terminal area
LDI r11, 0x00FF00   ; green frame
LDI r7, 0
LDI r12, 16
LDI r8, 256
LDI r6, 1
RECTF r7, r12, r8, r6, r11  ; top border
LDI r12, 255
RECTF r7, r12, r8, r6, r11  ; bottom border
LDI r7, 0
LDI r12, 16
LDI r8, 1
LDI r6, 240
RECTF r7, r12, r8, r6, r11  ; left border
LDI r7, 255
RECTF r7, r12, r8, r6, r11  ; right border

HALT
