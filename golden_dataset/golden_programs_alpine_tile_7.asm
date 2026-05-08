; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r8, 0
LDI r3, 0
LDI r6, 256
LDI r9, 16
RECTF r8, r3, r6, r9, r11

; Title text
LDI r10, 0x3000
STRO r10, "Alpine Linux Live Tile"
LDI r7, 3
LDI r16, 4
TEXT r7, r16, r10

; Status text
LDI r10, 0x3100
STRO r10, "Use: hypervisor_boot"
LDI r7, 2
LDI r16, 20
TEXT r7, r16, r10

LDI r10, 0x3200
STRO r10, "Status: hypervisor_status"
LDI r7, 2
LDI r16, 28
TEXT r7, r16, r10

; Draw a frame around the terminal area
LDI r11, 0x00FF00   ; green frame
LDI r8, 0
LDI r3, 16
LDI r6, 256
LDI r9, 1
RECTF r8, r3, r6, r9, r11  ; top border
LDI r3, 255
RECTF r8, r3, r6, r9, r11  ; bottom border
LDI r8, 0
LDI r3, 16
LDI r6, 1
LDI r9, 240
RECTF r8, r3, r6, r9, r11  ; left border
LDI r8, 255
RECTF r8, r3, r6, r9, r11  ; right border

HALT
