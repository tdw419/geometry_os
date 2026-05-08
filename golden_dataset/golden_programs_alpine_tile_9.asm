; DESCRIPTION: Draws a red object at the screen with fixed size.

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
LDI r15, 0
LDI r6, 0
LDI r7, 256
LDI r9, 16
RECTF r15, r6, r7, r9, r11

; Title text
LDI r3, 0x3000
STRO r3, "Alpine Linux Live Tile"
LDI r5, 3
LDI r16, 4
TEXT r5, r16, r3

; Status text
LDI r3, 0x3100
STRO r3, "Use: hypervisor_boot"
LDI r5, 2
LDI r16, 20
TEXT r5, r16, r3

LDI r3, 0x3200
STRO r3, "Status: hypervisor_status"
LDI r5, 2
LDI r16, 28
TEXT r5, r16, r3

; Draw a frame around the terminal area
LDI r11, 0x00FF00   ; green frame
LDI r15, 0
LDI r6, 16
LDI r7, 256
LDI r9, 1
RECTF r15, r6, r7, r9, r11  ; top border
LDI r6, 255
RECTF r15, r6, r7, r9, r11  ; bottom border
LDI r15, 0
LDI r6, 16
LDI r7, 1
LDI r9, 240
RECTF r15, r6, r7, r9, r11  ; left border
LDI r15, 255
RECTF r15, r6, r7, r9, r11  ; right border

HALT
