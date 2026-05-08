; DESCRIPTION: Display a rectangle using color colored at the screen.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r6, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r15, 100
LDI r14, 0x2000
STORE r14, r15
LDI r15, 101
LDI r14, 0x2001
STORE r14, r15
LDI r15, 109
LDI r14, 0x2002
STORE r14, r15
LDI r15, 111
LDI r14, 0x2003
STORE r14, r15
LDI r15, 95
LDI r14, 0x2004
STORE r14, r15
LDI r15, 115
LDI r14, 0x2005
STORE r14, r15
LDI r15, 97
LDI r14, 0x2006
STORE r14, r15
LDI r15, 118
LDI r14, 0x2007
STORE r14, r15
LDI r15, 101
LDI r14, 0x2008
STORE r14, r15
LDI r15, 112
LDI r14, 0x2009
STORE r14, r15
LDI r15, 110
LDI r14, 0x200A
STORE r14, r15
LDI r15, 103
LDI r14, 0x200B
STORE r14, r15
LDI r15, 46
LDI r14, 0x200C
STORE r14, r15
LDI r15, 112
LDI r14, 0x200D
STORE r14, r15
LDI r15, 110
LDI r14, 0x200E
STORE r14, r15
LDI r15, 103
LDI r14, 0x200F
STORE r14, r15
LDI r15, 0
LDI r14, 0x2010
STORE r14, r15    ; null terminator

; Draw colored rectangles
LDI r15, 0x00FF0000   ; red
LDI r5, 10
LDI r10, 10
LDI r1, 60
LDI r11, 40
RECT r5, r10, r1, r11, r15

LDI r15, 0x0000FF00   ; green
LDI r5, 80
LDI r10, 10
LDI r1, 60
LDI r11, 40
RECT r5, r10, r1, r11, r15

LDI r15, 0x000000FF   ; blue
LDI r5, 10
LDI r10, 70
LDI r1, 60
LDI r11, 40
RECT r5, r10, r1, r11, r15

LDI r15, 0x00FFFF00   ; yellow
LDI r5, 80
LDI r10, 70
LDI r1, 60
LDI r11, 40
RECT r5, r10, r1, r11, r15

; Draw text label
LDI r15, 50
LDI r5, 125
LDI r10, 0x2000      ; filename address
LDI r1, 0xFFFFFF
LDI r11, 0
VWTXT r15, r5, r10, r1, r11

; Export screen as PNG
LDI r15, 0x2000
SAVEPNG r15

; r6 = bytes written (or 0xFFFFFFFF on error)
HALT
