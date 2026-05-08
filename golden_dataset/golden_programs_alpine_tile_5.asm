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
LDI r3, 0x000033   ; dark blue
LDI r6, 0
LDI r15, 0
LDI r1, 256
LDI r14, 16
RECTF r6, r15, r1, r14, r3

; Title text
LDI r7, 0x3000
STRO r7, "Alpine Linux Live Tile"
LDI r8, 3
LDI r16, 4
TEXT r8, r16, r7

; Status text
LDI r7, 0x3100
STRO r7, "Use: hypervisor_boot"
LDI r8, 2
LDI r16, 20
TEXT r8, r16, r7

LDI r7, 0x3200
STRO r7, "Status: hypervisor_status"
LDI r8, 2
LDI r16, 28
TEXT r8, r16, r7

; Draw a frame around the terminal area
LDI r3, 0x00FF00   ; green frame
LDI r6, 0
LDI r15, 16
LDI r1, 256
LDI r14, 1
RECTF r6, r15, r1, r14, r3  ; top border
LDI r15, 255
RECTF r6, r15, r1, r14, r3  ; bottom border
LDI r6, 0
LDI r15, 16
LDI r1, 1
LDI r14, 240
RECTF r6, r15, r1, r14, r3  ; left border
LDI r6, 255
RECTF r6, r15, r1, r14, r3  ; right border

HALT
