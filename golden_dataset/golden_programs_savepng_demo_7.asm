; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r15, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r13, 100
LDI r9, 0x2000
STORE r9, r13
LDI r13, 101
LDI r9, 0x2001
STORE r9, r13
LDI r13, 109
LDI r9, 0x2002
STORE r9, r13
LDI r13, 111
LDI r9, 0x2003
STORE r9, r13
LDI r13, 95
LDI r9, 0x2004
STORE r9, r13
LDI r13, 115
LDI r9, 0x2005
STORE r9, r13
LDI r13, 97
LDI r9, 0x2006
STORE r9, r13
LDI r13, 118
LDI r9, 0x2007
STORE r9, r13
LDI r13, 101
LDI r9, 0x2008
STORE r9, r13
LDI r13, 112
LDI r9, 0x2009
STORE r9, r13
LDI r13, 110
LDI r9, 0x200A
STORE r9, r13
LDI r13, 103
LDI r9, 0x200B
STORE r9, r13
LDI r13, 46
LDI r9, 0x200C
STORE r9, r13
LDI r13, 112
LDI r9, 0x200D
STORE r9, r13
LDI r13, 110
LDI r9, 0x200E
STORE r9, r13
LDI r13, 103
LDI r9, 0x200F
STORE r9, r13
LDI r13, 0
LDI r9, 0x2010
STORE r9, r13    ; null terminator

; Draw colored rectangles
LDI r13, 0x00FF0000   ; red
LDI r12, 10
LDI r8, 10
LDI r2, 60
LDI r6, 40
RECT r12, r8, r2, r6, r13

LDI r13, 0x0000FF00   ; green
LDI r12, 80
LDI r8, 10
LDI r2, 60
LDI r6, 40
RECT r12, r8, r2, r6, r13

LDI r13, 0x000000FF   ; blue
LDI r12, 10
LDI r8, 70
LDI r2, 60
LDI r6, 40
RECT r12, r8, r2, r6, r13

LDI r13, 0x00FFFF00   ; yellow
LDI r12, 80
LDI r8, 70
LDI r2, 60
LDI r6, 40
RECT r12, r8, r2, r6, r13

; Draw text label
LDI r13, 50
LDI r12, 125
LDI r8, 0x2000      ; filename address
LDI r2, 0xFFFFFF
LDI r6, 0
VWTXT r13, r12, r8, r2, r6

; Export screen as PNG
LDI r13, 0x2000
SAVEPNG r13

; r15 = bytes written (or 0xFFFFFFFF on error)
HALT
