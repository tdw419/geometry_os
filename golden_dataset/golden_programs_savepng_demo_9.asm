; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r10, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r7, 100
LDI r5, 0x2000
STORE r5, r7
LDI r7, 101
LDI r5, 0x2001
STORE r5, r7
LDI r7, 109
LDI r5, 0x2002
STORE r5, r7
LDI r7, 111
LDI r5, 0x2003
STORE r5, r7
LDI r7, 95
LDI r5, 0x2004
STORE r5, r7
LDI r7, 115
LDI r5, 0x2005
STORE r5, r7
LDI r7, 97
LDI r5, 0x2006
STORE r5, r7
LDI r7, 118
LDI r5, 0x2007
STORE r5, r7
LDI r7, 101
LDI r5, 0x2008
STORE r5, r7
LDI r7, 112
LDI r5, 0x2009
STORE r5, r7
LDI r7, 110
LDI r5, 0x200A
STORE r5, r7
LDI r7, 103
LDI r5, 0x200B
STORE r5, r7
LDI r7, 46
LDI r5, 0x200C
STORE r5, r7
LDI r7, 112
LDI r5, 0x200D
STORE r5, r7
LDI r7, 110
LDI r5, 0x200E
STORE r5, r7
LDI r7, 103
LDI r5, 0x200F
STORE r5, r7
LDI r7, 0
LDI r5, 0x2010
STORE r5, r7    ; null terminator

; Draw colored rectangles
LDI r7, 0x00FF0000   ; red
LDI r12, 10
LDI r3, 10
LDI r13, 60
LDI r14, 40
RECT r12, r3, r13, r14, r7

LDI r7, 0x0000FF00   ; green
LDI r12, 80
LDI r3, 10
LDI r13, 60
LDI r14, 40
RECT r12, r3, r13, r14, r7

LDI r7, 0x000000FF   ; blue
LDI r12, 10
LDI r3, 70
LDI r13, 60
LDI r14, 40
RECT r12, r3, r13, r14, r7

LDI r7, 0x00FFFF00   ; yellow
LDI r12, 80
LDI r3, 70
LDI r13, 60
LDI r14, 40
RECT r12, r3, r13, r14, r7

; Draw text label
LDI r7, 50
LDI r12, 125
LDI r3, 0x2000      ; filename address
LDI r13, 0xFFFFFF
LDI r14, 0
VWTXT r7, r12, r3, r13, r14

; Export screen as PNG
LDI r7, 0x2000
SAVEPNG r7

; r10 = bytes written (or 0xFFFFFFFF on error)
HALT
