; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r5, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r9, 100
LDI r12, 0x2000
STORE r12, r9
LDI r9, 101
LDI r12, 0x2001
STORE r12, r9
LDI r9, 109
LDI r12, 0x2002
STORE r12, r9
LDI r9, 111
LDI r12, 0x2003
STORE r12, r9
LDI r9, 95
LDI r12, 0x2004
STORE r12, r9
LDI r9, 115
LDI r12, 0x2005
STORE r12, r9
LDI r9, 97
LDI r12, 0x2006
STORE r12, r9
LDI r9, 118
LDI r12, 0x2007
STORE r12, r9
LDI r9, 101
LDI r12, 0x2008
STORE r12, r9
LDI r9, 112
LDI r12, 0x2009
STORE r12, r9
LDI r9, 110
LDI r12, 0x200A
STORE r12, r9
LDI r9, 103
LDI r12, 0x200B
STORE r12, r9
LDI r9, 46
LDI r12, 0x200C
STORE r12, r9
LDI r9, 112
LDI r12, 0x200D
STORE r12, r9
LDI r9, 110
LDI r12, 0x200E
STORE r12, r9
LDI r9, 103
LDI r12, 0x200F
STORE r12, r9
LDI r9, 0
LDI r12, 0x2010
STORE r12, r9    ; null terminator

; Draw colored rectangles
LDI r9, 0x00FF0000   ; red
LDI r3, 10
LDI r2, 10
LDI r6, 60
LDI r0, 40
RECT r3, r2, r6, r0, r9

LDI r9, 0x0000FF00   ; green
LDI r3, 80
LDI r2, 10
LDI r6, 60
LDI r0, 40
RECT r3, r2, r6, r0, r9

LDI r9, 0x000000FF   ; blue
LDI r3, 10
LDI r2, 70
LDI r6, 60
LDI r0, 40
RECT r3, r2, r6, r0, r9

LDI r9, 0x00FFFF00   ; yellow
LDI r3, 80
LDI r2, 70
LDI r6, 60
LDI r0, 40
RECT r3, r2, r6, r0, r9

; Draw text label
LDI r9, 50
LDI r3, 125
LDI r2, 0x2000      ; filename address
LDI r6, 0xFFFFFF
LDI r0, 0
VWTXT r9, r3, r2, r6, r0

; Export screen as PNG
LDI r9, 0x2000
SAVEPNG r9

; r5 = bytes written (or 0xFFFFFFFF on error)
HALT
