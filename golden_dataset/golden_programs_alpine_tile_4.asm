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
LDI r13, 0x000033   ; dark blue
LDI r10, 0
LDI r1, 0
LDI r15, 256
LDI r4, 16
RECTF r10, r1, r15, r4, r13

; Title text
LDI r3, 0x3000
STRO r3, "Alpine Linux Live Tile"
LDI r8, 3
LDI r16, 4
TEXT r8, r16, r3

; Status text
LDI r3, 0x3100
STRO r3, "Use: hypervisor_boot"
LDI r8, 2
LDI r16, 20
TEXT r8, r16, r3

LDI r3, 0x3200
STRO r3, "Status: hypervisor_status"
LDI r8, 2
LDI r16, 28
TEXT r8, r16, r3

; Draw a frame around the terminal area
LDI r13, 0x00FF00   ; green frame
LDI r10, 0
LDI r1, 16
LDI r15, 256
LDI r4, 1
RECTF r10, r1, r15, r4, r13  ; top border
LDI r1, 255
RECTF r10, r1, r15, r4, r13  ; bottom border
LDI r10, 0
LDI r1, 16
LDI r15, 1
LDI r4, 240
RECTF r10, r1, r15, r4, r13  ; left border
LDI r10, 255
RECTF r10, r1, r15, r4, r13  ; right border

HALT
