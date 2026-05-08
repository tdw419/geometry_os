; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r14, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r0, 100
LDI r4, 0x2000
STORE r4, r0
LDI r0, 101
LDI r4, 0x2001
STORE r4, r0
LDI r0, 109
LDI r4, 0x2002
STORE r4, r0
LDI r0, 111
LDI r4, 0x2003
STORE r4, r0
LDI r0, 95
LDI r4, 0x2004
STORE r4, r0
LDI r0, 115
LDI r4, 0x2005
STORE r4, r0
LDI r0, 97
LDI r4, 0x2006
STORE r4, r0
LDI r0, 118
LDI r4, 0x2007
STORE r4, r0
LDI r0, 101
LDI r4, 0x2008
STORE r4, r0
LDI r0, 112
LDI r4, 0x2009
STORE r4, r0
LDI r0, 110
LDI r4, 0x200A
STORE r4, r0
LDI r0, 103
LDI r4, 0x200B
STORE r4, r0
LDI r0, 46
LDI r4, 0x200C
STORE r4, r0
LDI r0, 112
LDI r4, 0x200D
STORE r4, r0
LDI r0, 110
LDI r4, 0x200E
STORE r4, r0
LDI r0, 103
LDI r4, 0x200F
STORE r4, r0
LDI r0, 0
LDI r4, 0x2010
STORE r4, r0    ; null terminator

; Draw colored rectangles
LDI r0, 0x00FF0000   ; red
LDI r6, 10
LDI r7, 10
LDI r9, 60
LDI r11, 40
RECT r6, r7, r9, r11, r0

LDI r0, 0x0000FF00   ; green
LDI r6, 80
LDI r7, 10
LDI r9, 60
LDI r11, 40
RECT r6, r7, r9, r11, r0

LDI r0, 0x000000FF   ; blue
LDI r6, 10
LDI r7, 70
LDI r9, 60
LDI r11, 40
RECT r6, r7, r9, r11, r0

LDI r0, 0x00FFFF00   ; yellow
LDI r6, 80
LDI r7, 70
LDI r9, 60
LDI r11, 40
RECT r6, r7, r9, r11, r0

; Draw text label
LDI r0, 50
LDI r6, 125
LDI r7, 0x2000      ; filename address
LDI r9, 0xFFFFFF
LDI r11, 0
VWTXT r0, r6, r7, r9, r11

; Export screen as PNG
LDI r0, 0x2000
SAVEPNG r0

; r14 = bytes written (or 0xFFFFFFFF on error)
HALT
