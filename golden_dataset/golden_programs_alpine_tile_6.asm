; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r5, 0x000033   ; dark blue
LDI r6, 0
LDI r9, 0
LDI r13, 256
LDI r8, 16
RECTF r6, r9, r13, r8, r5

; Title text
LDI r2, 0x3000
STRO r2, "Alpine Linux Live Tile"
LDI r4, 3
LDI r16, 4
TEXT r4, r16, r2

; Status text
LDI r2, 0x3100
STRO r2, "Use: hypervisor_boot"
LDI r4, 2
LDI r16, 20
TEXT r4, r16, r2

LDI r2, 0x3200
STRO r2, "Status: hypervisor_status"
LDI r4, 2
LDI r16, 28
TEXT r4, r16, r2

; Draw a frame around the terminal area
LDI r5, 0x00FF00   ; green frame
LDI r6, 0
LDI r9, 16
LDI r13, 256
LDI r8, 1
RECTF r6, r9, r13, r8, r5  ; top border
LDI r9, 255
RECTF r6, r9, r13, r8, r5  ; bottom border
LDI r6, 0
LDI r9, 16
LDI r13, 1
LDI r8, 240
RECTF r6, r9, r13, r8, r5  ; left border
LDI r6, 255
RECTF r6, r9, r13, r8, r5  ; right border

HALT
