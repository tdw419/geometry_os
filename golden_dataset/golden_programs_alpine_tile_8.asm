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
LDI r3, 0
LDI r15, 0
LDI r10, 256
LDI r4, 16
RECTF r3, r15, r10, r4, r11

; Title text
LDI r6, 0x3000
STRO r6, "Alpine Linux Live Tile"
LDI r12, 3
LDI r16, 4
TEXT r12, r16, r6

; Status text
LDI r6, 0x3100
STRO r6, "Use: hypervisor_boot"
LDI r12, 2
LDI r16, 20
TEXT r12, r16, r6

LDI r6, 0x3200
STRO r6, "Status: hypervisor_status"
LDI r12, 2
LDI r16, 28
TEXT r12, r16, r6

; Draw a frame around the terminal area
LDI r11, 0x00FF00   ; green frame
LDI r3, 0
LDI r15, 16
LDI r10, 256
LDI r4, 1
RECTF r3, r15, r10, r4, r11  ; top border
LDI r15, 255
RECTF r3, r15, r10, r4, r11  ; bottom border
LDI r3, 0
LDI r15, 16
LDI r10, 1
LDI r4, 240
RECTF r3, r15, r10, r4, r11  ; left border
LDI r3, 255
RECTF r3, r15, r10, r4, r11  ; right border

HALT
