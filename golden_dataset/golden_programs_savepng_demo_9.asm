; DESCRIPTION: This GeOS assembly code draws a colorful pattern on the screen using rectangles of different colors and then exports the current screen as a PNG file named "demo_savepng.png" to the virtual filesystem. The code stores the filename in memory, uses drawing commands to render the pattern, writes a text label, and finally calls the SAVEPNG opcode to perform the export, returning the number of bytes written or an error code.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r5, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r0, 100
LDI r13, 0x2000
STORE r13, r0
LDI r0, 101
LDI r13, 0x2001
STORE r13, r0
LDI r0, 109
LDI r13, 0x2002
STORE r13, r0
LDI r0, 111
LDI r13, 0x2003
STORE r13, r0
LDI r0, 95
LDI r13, 0x2004
STORE r13, r0
LDI r0, 115
LDI r13, 0x2005
STORE r13, r0
LDI r0, 97
LDI r13, 0x2006
STORE r13, r0
LDI r0, 118
LDI r13, 0x2007
STORE r13, r0
LDI r0, 101
LDI r13, 0x2008
STORE r13, r0
LDI r0, 112
LDI r13, 0x2009
STORE r13, r0
LDI r0, 110
LDI r13, 0x200A
STORE r13, r0
LDI r0, 103
LDI r13, 0x200B
STORE r13, r0
LDI r0, 46
LDI r13, 0x200C
STORE r13, r0
LDI r0, 112
LDI r13, 0x200D
STORE r13, r0
LDI r0, 110
LDI r13, 0x200E
STORE r13, r0
LDI r0, 103
LDI r13, 0x200F
STORE r13, r0
LDI r0, 0
LDI r13, 0x2010
STORE r13, r0    ; null terminator

; Draw colored rectangles
LDI r0, 0x00FF0000   ; red
LDI r15, 10
LDI r1, 10
LDI r14, 60
LDI r10, 40
RECT r15, r1, r14, r10, r0

LDI r0, 0x0000FF00   ; green
LDI r15, 80
LDI r1, 10
LDI r14, 60
LDI r10, 40
RECT r15, r1, r14, r10, r0

LDI r0, 0x000000FF   ; blue
LDI r15, 10
LDI r1, 70
LDI r14, 60
LDI r10, 40
RECT r15, r1, r14, r10, r0

LDI r0, 0x00FFFF00   ; yellow
LDI r15, 80
LDI r1, 70
LDI r14, 60
LDI r10, 40
RECT r15, r1, r14, r10, r0

; Draw text label
LDI r0, 50
LDI r15, 125
LDI r1, 0x2000      ; filename address
LDI r14, 0xFFFFFF
LDI r10, 0
VWTXT r0, r15, r1, r14, r10

; Export screen as PNG
LDI r0, 0x2000
SAVEPNG r0

; r5 = bytes written (or 0xFFFFFFFF on error)
HALT
