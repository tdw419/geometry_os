; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r2, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r0, 100
LDI r3, 0x2000
STORE r3, r0
LDI r0, 101
LDI r3, 0x2001
STORE r3, r0
LDI r0, 109
LDI r3, 0x2002
STORE r3, r0
LDI r0, 111
LDI r3, 0x2003
STORE r3, r0
LDI r0, 95
LDI r3, 0x2004
STORE r3, r0
LDI r0, 115
LDI r3, 0x2005
STORE r3, r0
LDI r0, 97
LDI r3, 0x2006
STORE r3, r0
LDI r0, 118
LDI r3, 0x2007
STORE r3, r0
LDI r0, 101
LDI r3, 0x2008
STORE r3, r0
LDI r0, 112
LDI r3, 0x2009
STORE r3, r0
LDI r0, 110
LDI r3, 0x200A
STORE r3, r0
LDI r0, 103
LDI r3, 0x200B
STORE r3, r0
LDI r0, 46
LDI r3, 0x200C
STORE r3, r0
LDI r0, 112
LDI r3, 0x200D
STORE r3, r0
LDI r0, 110
LDI r3, 0x200E
STORE r3, r0
LDI r0, 103
LDI r3, 0x200F
STORE r3, r0
LDI r0, 0
LDI r3, 0x2010
STORE r3, r0    ; null terminator

; Draw colored rectangles
LDI r0, 0x00FF0000   ; red
LDI r12, 10
LDI r6, 10
LDI r15, 60
LDI r13, 40
RECT r12, r6, r15, r13, r0

LDI r0, 0x0000FF00   ; green
LDI r12, 80
LDI r6, 10
LDI r15, 60
LDI r13, 40
RECT r12, r6, r15, r13, r0

LDI r0, 0x000000FF   ; blue
LDI r12, 10
LDI r6, 70
LDI r15, 60
LDI r13, 40
RECT r12, r6, r15, r13, r0

LDI r0, 0x00FFFF00   ; yellow
LDI r12, 80
LDI r6, 70
LDI r15, 60
LDI r13, 40
RECT r12, r6, r15, r13, r0

; Draw text label
LDI r0, 50
LDI r12, 125
LDI r6, 0x2000      ; filename address
LDI r15, 0xFFFFFF
LDI r13, 0
VWTXT r0, r12, r6, r15, r13

; Export screen as PNG
LDI r0, 0x2000
SAVEPNG r0

; r2 = bytes written (or 0xFFFFFFFF on error)
HALT
