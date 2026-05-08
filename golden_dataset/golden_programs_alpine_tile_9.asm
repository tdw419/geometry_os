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
LDI r14, 0x000033   ; dark blue
LDI r7, 0
LDI r0, 0
LDI r9, 256
LDI r15, 16
RECTF r7, r0, r9, r15, r14

; Title text
LDI r10, 0x3000
STRO r10, "Alpine Linux Live Tile"
LDI r5, 3
LDI r16, 4
TEXT r5, r16, r10

; Status text
LDI r10, 0x3100
STRO r10, "Use: hypervisor_boot"
LDI r5, 2
LDI r16, 20
TEXT r5, r16, r10

LDI r10, 0x3200
STRO r10, "Status: hypervisor_status"
LDI r5, 2
LDI r16, 28
TEXT r5, r16, r10

; Draw a frame around the terminal area
LDI r14, 0x00FF00   ; green frame
LDI r7, 0
LDI r0, 16
LDI r9, 256
LDI r15, 1
RECTF r7, r0, r9, r15, r14  ; top border
LDI r0, 255
RECTF r7, r0, r9, r15, r14  ; bottom border
LDI r7, 0
LDI r0, 16
LDI r9, 1
LDI r15, 240
RECTF r7, r0, r9, r15, r14  ; left border
LDI r7, 255
RECTF r7, r0, r9, r15, r14  ; right border

HALT
