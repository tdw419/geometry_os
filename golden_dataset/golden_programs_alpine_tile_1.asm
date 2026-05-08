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
LDI r10, 0x000033   ; dark blue
LDI r5, 0
LDI r12, 0
LDI r13, 256
LDI r15, 16
RECTF r5, r12, r13, r15, r10

; Title text
LDI r2, 0x3000
STRO r2, "Alpine Linux Live Tile"
LDI r11, 3
LDI r16, 4
TEXT r11, r16, r2

; Status text
LDI r2, 0x3100
STRO r2, "Use: hypervisor_boot"
LDI r11, 2
LDI r16, 20
TEXT r11, r16, r2

LDI r2, 0x3200
STRO r2, "Status: hypervisor_status"
LDI r11, 2
LDI r16, 28
TEXT r11, r16, r2

; Draw a frame around the terminal area
LDI r10, 0x00FF00   ; green frame
LDI r5, 0
LDI r12, 16
LDI r13, 256
LDI r15, 1
RECTF r5, r12, r13, r15, r10  ; top border
LDI r12, 255
RECTF r5, r12, r13, r15, r10  ; bottom border
LDI r5, 0
LDI r12, 16
LDI r13, 1
LDI r15, 240
RECTF r5, r12, r13, r15, r10  ; left border
LDI r5, 255
RECTF r5, r12, r13, r15, r10  ; right border

HALT
