; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r15, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r11, 100
LDI r8, 0x2000
STORE r8, r11
LDI r11, 101
LDI r8, 0x2001
STORE r8, r11
LDI r11, 109
LDI r8, 0x2002
STORE r8, r11
LDI r11, 111
LDI r8, 0x2003
STORE r8, r11
LDI r11, 95
LDI r8, 0x2004
STORE r8, r11
LDI r11, 115
LDI r8, 0x2005
STORE r8, r11
LDI r11, 97
LDI r8, 0x2006
STORE r8, r11
LDI r11, 118
LDI r8, 0x2007
STORE r8, r11
LDI r11, 101
LDI r8, 0x2008
STORE r8, r11
LDI r11, 112
LDI r8, 0x2009
STORE r8, r11
LDI r11, 110
LDI r8, 0x200A
STORE r8, r11
LDI r11, 103
LDI r8, 0x200B
STORE r8, r11
LDI r11, 46
LDI r8, 0x200C
STORE r8, r11
LDI r11, 112
LDI r8, 0x200D
STORE r8, r11
LDI r11, 110
LDI r8, 0x200E
STORE r8, r11
LDI r11, 103
LDI r8, 0x200F
STORE r8, r11
LDI r11, 0
LDI r8, 0x2010
STORE r8, r11    ; null terminator

; Draw colored rectangles
LDI r11, 0x00FF0000   ; red
LDI r0, 10
LDI r4, 10
LDI r6, 60
LDI r1, 40
RECT r0, r4, r6, r1, r11

LDI r11, 0x0000FF00   ; green
LDI r0, 80
LDI r4, 10
LDI r6, 60
LDI r1, 40
RECT r0, r4, r6, r1, r11

LDI r11, 0x000000FF   ; blue
LDI r0, 10
LDI r4, 70
LDI r6, 60
LDI r1, 40
RECT r0, r4, r6, r1, r11

LDI r11, 0x00FFFF00   ; yellow
LDI r0, 80
LDI r4, 70
LDI r6, 60
LDI r1, 40
RECT r0, r4, r6, r1, r11

; Draw text label
LDI r11, 50
LDI r0, 125
LDI r4, 0x2000      ; filename address
LDI r6, 0xFFFFFF
LDI r1, 0
VWTXT r11, r0, r4, r6, r1

; Export screen as PNG
LDI r11, 0x2000
SAVEPNG r11

; r15 = bytes written (or 0xFFFFFFFF on error)
HALT
