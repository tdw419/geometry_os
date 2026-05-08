; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r15, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r8, 100
LDI r1, 0x2000
STORE r1, r8
LDI r8, 101
LDI r1, 0x2001
STORE r1, r8
LDI r8, 109
LDI r1, 0x2002
STORE r1, r8
LDI r8, 111
LDI r1, 0x2003
STORE r1, r8
LDI r8, 95
LDI r1, 0x2004
STORE r1, r8
LDI r8, 115
LDI r1, 0x2005
STORE r1, r8
LDI r8, 97
LDI r1, 0x2006
STORE r1, r8
LDI r8, 118
LDI r1, 0x2007
STORE r1, r8
LDI r8, 101
LDI r1, 0x2008
STORE r1, r8
LDI r8, 112
LDI r1, 0x2009
STORE r1, r8
LDI r8, 110
LDI r1, 0x200A
STORE r1, r8
LDI r8, 103
LDI r1, 0x200B
STORE r1, r8
LDI r8, 46
LDI r1, 0x200C
STORE r1, r8
LDI r8, 112
LDI r1, 0x200D
STORE r1, r8
LDI r8, 110
LDI r1, 0x200E
STORE r1, r8
LDI r8, 103
LDI r1, 0x200F
STORE r1, r8
LDI r8, 0
LDI r1, 0x2010
STORE r1, r8    ; null terminator

; Draw colored rectangles
LDI r8, 0x00FF0000   ; red
LDI r10, 10
LDI r11, 10
LDI r3, 60
LDI r5, 40
RECT r10, r11, r3, r5, r8

LDI r8, 0x0000FF00   ; green
LDI r10, 80
LDI r11, 10
LDI r3, 60
LDI r5, 40
RECT r10, r11, r3, r5, r8

LDI r8, 0x000000FF   ; blue
LDI r10, 10
LDI r11, 70
LDI r3, 60
LDI r5, 40
RECT r10, r11, r3, r5, r8

LDI r8, 0x00FFFF00   ; yellow
LDI r10, 80
LDI r11, 70
LDI r3, 60
LDI r5, 40
RECT r10, r11, r3, r5, r8

; Draw text label
LDI r8, 50
LDI r10, 125
LDI r11, 0x2000      ; filename address
LDI r3, 0xFFFFFF
LDI r5, 0
VWTXT r8, r10, r11, r3, r5

; Export screen as PNG
LDI r8, 0x2000
SAVEPNG r8

; r15 = bytes written (or 0xFFFFFFFF on error)
HALT
