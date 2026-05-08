; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r0, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r10, 100
LDI r4, 0x2000
STORE r4, r10
LDI r10, 101
LDI r4, 0x2001
STORE r4, r10
LDI r10, 109
LDI r4, 0x2002
STORE r4, r10
LDI r10, 111
LDI r4, 0x2003
STORE r4, r10
LDI r10, 95
LDI r4, 0x2004
STORE r4, r10
LDI r10, 115
LDI r4, 0x2005
STORE r4, r10
LDI r10, 97
LDI r4, 0x2006
STORE r4, r10
LDI r10, 118
LDI r4, 0x2007
STORE r4, r10
LDI r10, 101
LDI r4, 0x2008
STORE r4, r10
LDI r10, 112
LDI r4, 0x2009
STORE r4, r10
LDI r10, 110
LDI r4, 0x200A
STORE r4, r10
LDI r10, 103
LDI r4, 0x200B
STORE r4, r10
LDI r10, 46
LDI r4, 0x200C
STORE r4, r10
LDI r10, 112
LDI r4, 0x200D
STORE r4, r10
LDI r10, 110
LDI r4, 0x200E
STORE r4, r10
LDI r10, 103
LDI r4, 0x200F
STORE r4, r10
LDI r10, 0
LDI r4, 0x2010
STORE r4, r10    ; null terminator

; Draw colored rectangles
LDI r10, 0x00FF0000   ; red
LDI r3, 10
LDI r11, 10
LDI r8, 60
LDI r7, 40
RECT r3, r11, r8, r7, r10

LDI r10, 0x0000FF00   ; green
LDI r3, 80
LDI r11, 10
LDI r8, 60
LDI r7, 40
RECT r3, r11, r8, r7, r10

LDI r10, 0x000000FF   ; blue
LDI r3, 10
LDI r11, 70
LDI r8, 60
LDI r7, 40
RECT r3, r11, r8, r7, r10

LDI r10, 0x00FFFF00   ; yellow
LDI r3, 80
LDI r11, 70
LDI r8, 60
LDI r7, 40
RECT r3, r11, r8, r7, r10

; Draw text label
LDI r10, 50
LDI r3, 125
LDI r11, 0x2000      ; filename address
LDI r8, 0xFFFFFF
LDI r7, 0
VWTXT r10, r3, r11, r8, r7

; Export screen as PNG
LDI r10, 0x2000
SAVEPNG r10

; r0 = bytes written (or 0xFFFFFFFF on error)
HALT
