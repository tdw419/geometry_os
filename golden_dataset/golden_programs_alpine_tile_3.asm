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
LDI r0, 0
LDI r13, 0
LDI r10, 256
LDI r8, 16
RECTF r0, r13, r10, r8, r9

; Title text
LDI r1, 0x3000
STRO r1, "Alpine Linux Live Tile"
LDI r3, 3
LDI r16, 4
TEXT r3, r16, r1

; Status text
LDI r1, 0x3100
STRO r1, "Use: hypervisor_boot"
LDI r3, 2
LDI r16, 20
TEXT r3, r16, r1

LDI r1, 0x3200
STRO r1, "Status: hypervisor_status"
LDI r3, 2
LDI r16, 28
TEXT r3, r16, r1

; Draw a frame around the terminal area
LDI r9, 0x00FF00   ; green frame
LDI r0, 0
LDI r13, 16
LDI r10, 256
LDI r8, 1
RECTF r0, r13, r10, r8, r9  ; top border
LDI r13, 255
RECTF r0, r13, r10, r8, r9  ; bottom border
LDI r0, 0
LDI r13, 16
LDI r10, 1
LDI r8, 240
RECTF r0, r13, r10, r8, r9  ; left border
LDI r0, 255
RECTF r0, r13, r10, r8, r9  ; right border

HALT
