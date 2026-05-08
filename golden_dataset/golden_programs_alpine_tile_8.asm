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
LDI r15, 0x000033   ; dark blue
LDI r5, 0
LDI r4, 0
LDI r13, 256
LDI r6, 16
RECTF r5, r4, r13, r6, r15

; Title text
LDI r11, 0x3000
STRO r11, "Alpine Linux Live Tile"
LDI r7, 3
LDI r16, 4
TEXT r7, r16, r11

; Status text
LDI r11, 0x3100
STRO r11, "Use: hypervisor_boot"
LDI r7, 2
LDI r16, 20
TEXT r7, r16, r11

LDI r11, 0x3200
STRO r11, "Status: hypervisor_status"
LDI r7, 2
LDI r16, 28
TEXT r7, r16, r11

; Draw a frame around the terminal area
LDI r15, 0x00FF00   ; green frame
LDI r5, 0
LDI r4, 16
LDI r13, 256
LDI r6, 1
RECTF r5, r4, r13, r6, r15  ; top border
LDI r4, 255
RECTF r5, r4, r13, r6, r15  ; bottom border
LDI r5, 0
LDI r4, 16
LDI r13, 1
LDI r6, 240
RECTF r5, r4, r13, r6, r15  ; left border
LDI r5, 255
RECTF r5, r4, r13, r6, r15  ; right border

HALT
