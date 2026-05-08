; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r4, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r3, 100
LDI r10, 0x2000
STORE r10, r3
LDI r3, 101
LDI r10, 0x2001
STORE r10, r3
LDI r3, 109
LDI r10, 0x2002
STORE r10, r3
LDI r3, 111
LDI r10, 0x2003
STORE r10, r3
LDI r3, 95
LDI r10, 0x2004
STORE r10, r3
LDI r3, 115
LDI r10, 0x2005
STORE r10, r3
LDI r3, 97
LDI r10, 0x2006
STORE r10, r3
LDI r3, 118
LDI r10, 0x2007
STORE r10, r3
LDI r3, 101
LDI r10, 0x2008
STORE r10, r3
LDI r3, 112
LDI r10, 0x2009
STORE r10, r3
LDI r3, 110
LDI r10, 0x200A
STORE r10, r3
LDI r3, 103
LDI r10, 0x200B
STORE r10, r3
LDI r3, 46
LDI r10, 0x200C
STORE r10, r3
LDI r3, 112
LDI r10, 0x200D
STORE r10, r3
LDI r3, 110
LDI r10, 0x200E
STORE r10, r3
LDI r3, 103
LDI r10, 0x200F
STORE r10, r3
LDI r3, 0
LDI r10, 0x2010
STORE r10, r3    ; null terminator

; Draw colored rectangles
LDI r3, 0x00FF0000   ; red
LDI r6, 10
LDI r0, 10
LDI r12, 60
LDI r15, 40
RECT r6, r0, r12, r15, r3

LDI r3, 0x0000FF00   ; green
LDI r6, 80
LDI r0, 10
LDI r12, 60
LDI r15, 40
RECT r6, r0, r12, r15, r3

LDI r3, 0x000000FF   ; blue
LDI r6, 10
LDI r0, 70
LDI r12, 60
LDI r15, 40
RECT r6, r0, r12, r15, r3

LDI r3, 0x00FFFF00   ; yellow
LDI r6, 80
LDI r0, 70
LDI r12, 60
LDI r15, 40
RECT r6, r0, r12, r15, r3

; Draw text label
LDI r3, 50
LDI r6, 125
LDI r0, 0x2000      ; filename address
LDI r12, 0xFFFFFF
LDI r15, 0
VWTXT r3, r6, r0, r12, r15

; Export screen as PNG
LDI r3, 0x2000
SAVEPNG r3

; r4 = bytes written (or 0xFFFFFFFF on error)
HALT
