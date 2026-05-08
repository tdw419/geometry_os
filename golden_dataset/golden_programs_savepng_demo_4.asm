; DESCRIPTION: Render a colored rectangle at the screen.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r10, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r8, 100
LDI r11, 0x2000
STORE r11, r8
LDI r8, 101
LDI r11, 0x2001
STORE r11, r8
LDI r8, 109
LDI r11, 0x2002
STORE r11, r8
LDI r8, 111
LDI r11, 0x2003
STORE r11, r8
LDI r8, 95
LDI r11, 0x2004
STORE r11, r8
LDI r8, 115
LDI r11, 0x2005
STORE r11, r8
LDI r8, 97
LDI r11, 0x2006
STORE r11, r8
LDI r8, 118
LDI r11, 0x2007
STORE r11, r8
LDI r8, 101
LDI r11, 0x2008
STORE r11, r8
LDI r8, 112
LDI r11, 0x2009
STORE r11, r8
LDI r8, 110
LDI r11, 0x200A
STORE r11, r8
LDI r8, 103
LDI r11, 0x200B
STORE r11, r8
LDI r8, 46
LDI r11, 0x200C
STORE r11, r8
LDI r8, 112
LDI r11, 0x200D
STORE r11, r8
LDI r8, 110
LDI r11, 0x200E
STORE r11, r8
LDI r8, 103
LDI r11, 0x200F
STORE r11, r8
LDI r8, 0
LDI r11, 0x2010
STORE r11, r8    ; null terminator

; Draw colored rectangles
LDI r8, 0x00FF0000   ; red
LDI r6, 10
LDI r3, 10
LDI r5, 60
LDI r13, 40
RECT r6, r3, r5, r13, r8

LDI r8, 0x0000FF00   ; green
LDI r6, 80
LDI r3, 10
LDI r5, 60
LDI r13, 40
RECT r6, r3, r5, r13, r8

LDI r8, 0x000000FF   ; blue
LDI r6, 10
LDI r3, 70
LDI r5, 60
LDI r13, 40
RECT r6, r3, r5, r13, r8

LDI r8, 0x00FFFF00   ; yellow
LDI r6, 80
LDI r3, 70
LDI r5, 60
LDI r13, 40
RECT r6, r3, r5, r13, r8

; Draw text label
LDI r8, 50
LDI r6, 125
LDI r3, 0x2000      ; filename address
LDI r5, 0xFFFFFF
LDI r13, 0
VWTXT r8, r6, r3, r5, r13

; Export screen as PNG
LDI r8, 0x2000
SAVEPNG r8

; r10 = bytes written (or 0xFFFFFFFF on error)
HALT
