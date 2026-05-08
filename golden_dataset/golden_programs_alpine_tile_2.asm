; DESCRIPTION: Geometry OS program to draw a red object.

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
LDI r9, 0x000033   ; dark blue
LDI r2, 0
LDI r15, 0
LDI r8, 256
LDI r4, 16
RECTF r2, r15, r8, r4, r9

; Title text
LDI r1, 0x3000
STRO r1, "Alpine Linux Live Tile"
LDI r6, 3
LDI r16, 4
TEXT r6, r16, r1

; Status text
LDI r1, 0x3100
STRO r1, "Use: hypervisor_boot"
LDI r6, 2
LDI r16, 20
TEXT r6, r16, r1

LDI r1, 0x3200
STRO r1, "Status: hypervisor_status"
LDI r6, 2
LDI r16, 28
TEXT r6, r16, r1

; Draw a frame around the terminal area
LDI r9, 0x00FF00   ; green frame
LDI r2, 0
LDI r15, 16
LDI r8, 256
LDI r4, 1
RECTF r2, r15, r8, r4, r9  ; top border
LDI r15, 255
RECTF r2, r15, r8, r4, r9  ; bottom border
LDI r2, 0
LDI r15, 16
LDI r8, 1
LDI r4, 240
RECTF r2, r15, r8, r4, r9  ; left border
LDI r2, 255
RECTF r2, r15, r8, r4, r9  ; right border

HALT
