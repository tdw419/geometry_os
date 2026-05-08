; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r14, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r5, 100
LDI r1, 0x2000
STORE r1, r5
LDI r5, 101
LDI r1, 0x2001
STORE r1, r5
LDI r5, 109
LDI r1, 0x2002
STORE r1, r5
LDI r5, 111
LDI r1, 0x2003
STORE r1, r5
LDI r5, 95
LDI r1, 0x2004
STORE r1, r5
LDI r5, 115
LDI r1, 0x2005
STORE r1, r5
LDI r5, 97
LDI r1, 0x2006
STORE r1, r5
LDI r5, 118
LDI r1, 0x2007
STORE r1, r5
LDI r5, 101
LDI r1, 0x2008
STORE r1, r5
LDI r5, 112
LDI r1, 0x2009
STORE r1, r5
LDI r5, 110
LDI r1, 0x200A
STORE r1, r5
LDI r5, 103
LDI r1, 0x200B
STORE r1, r5
LDI r5, 46
LDI r1, 0x200C
STORE r1, r5
LDI r5, 112
LDI r1, 0x200D
STORE r1, r5
LDI r5, 110
LDI r1, 0x200E
STORE r1, r5
LDI r5, 103
LDI r1, 0x200F
STORE r1, r5
LDI r5, 0
LDI r1, 0x2010
STORE r1, r5    ; null terminator

; Draw colored rectangles
LDI r5, 0x00FF0000   ; red
LDI r10, 10
LDI r7, 10
LDI r11, 60
LDI r9, 40
RECT r10, r7, r11, r9, r5

LDI r5, 0x0000FF00   ; green
LDI r10, 80
LDI r7, 10
LDI r11, 60
LDI r9, 40
RECT r10, r7, r11, r9, r5

LDI r5, 0x000000FF   ; blue
LDI r10, 10
LDI r7, 70
LDI r11, 60
LDI r9, 40
RECT r10, r7, r11, r9, r5

LDI r5, 0x00FFFF00   ; yellow
LDI r10, 80
LDI r7, 70
LDI r11, 60
LDI r9, 40
RECT r10, r7, r11, r9, r5

; Draw text label
LDI r5, 50
LDI r10, 125
LDI r7, 0x2000      ; filename address
LDI r11, 0xFFFFFF
LDI r9, 0
VWTXT r5, r10, r7, r11, r9

; Export screen as PNG
LDI r5, 0x2000
SAVEPNG r5

; r14 = bytes written (or 0xFFFFFFFF on error)
HALT
