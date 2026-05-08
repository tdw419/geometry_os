; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r12, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r7, 100
LDI r11, 0x2000
STORE r11, r7
LDI r7, 101
LDI r11, 0x2001
STORE r11, r7
LDI r7, 109
LDI r11, 0x2002
STORE r11, r7
LDI r7, 111
LDI r11, 0x2003
STORE r11, r7
LDI r7, 95
LDI r11, 0x2004
STORE r11, r7
LDI r7, 115
LDI r11, 0x2005
STORE r11, r7
LDI r7, 97
LDI r11, 0x2006
STORE r11, r7
LDI r7, 118
LDI r11, 0x2007
STORE r11, r7
LDI r7, 101
LDI r11, 0x2008
STORE r11, r7
LDI r7, 112
LDI r11, 0x2009
STORE r11, r7
LDI r7, 110
LDI r11, 0x200A
STORE r11, r7
LDI r7, 103
LDI r11, 0x200B
STORE r11, r7
LDI r7, 46
LDI r11, 0x200C
STORE r11, r7
LDI r7, 112
LDI r11, 0x200D
STORE r11, r7
LDI r7, 110
LDI r11, 0x200E
STORE r11, r7
LDI r7, 103
LDI r11, 0x200F
STORE r11, r7
LDI r7, 0
LDI r11, 0x2010
STORE r11, r7    ; null terminator

; Draw colored rectangles
LDI r7, 0x00FF0000   ; red
LDI r9, 10
LDI r10, 10
LDI r1, 60
LDI r3, 40
RECT r9, r10, r1, r3, r7

LDI r7, 0x0000FF00   ; green
LDI r9, 80
LDI r10, 10
LDI r1, 60
LDI r3, 40
RECT r9, r10, r1, r3, r7

LDI r7, 0x000000FF   ; blue
LDI r9, 10
LDI r10, 70
LDI r1, 60
LDI r3, 40
RECT r9, r10, r1, r3, r7

LDI r7, 0x00FFFF00   ; yellow
LDI r9, 80
LDI r10, 70
LDI r1, 60
LDI r3, 40
RECT r9, r10, r1, r3, r7

; Draw text label
LDI r7, 50
LDI r9, 125
LDI r10, 0x2000      ; filename address
LDI r1, 0xFFFFFF
LDI r3, 0
VWTXT r7, r9, r10, r1, r3

; Export screen as PNG
LDI r7, 0x2000
SAVEPNG r7

; r12 = bytes written (or 0xFFFFFFFF on error)
HALT
