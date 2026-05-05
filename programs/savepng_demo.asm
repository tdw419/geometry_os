; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r0, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r1, 100
LDI r9, 0x2000
STORE r9, r1
LDI r1, 101
LDI r9, 0x2001
STORE r9, r1
LDI r1, 109
LDI r9, 0x2002
STORE r9, r1
LDI r1, 111
LDI r9, 0x2003
STORE r9, r1
LDI r1, 95
LDI r9, 0x2004
STORE r9, r1
LDI r1, 115
LDI r9, 0x2005
STORE r9, r1
LDI r1, 97
LDI r9, 0x2006
STORE r9, r1
LDI r1, 118
LDI r9, 0x2007
STORE r9, r1
LDI r1, 101
LDI r9, 0x2008
STORE r9, r1
LDI r1, 112
LDI r9, 0x2009
STORE r9, r1
LDI r1, 110
LDI r9, 0x200A
STORE r9, r1
LDI r1, 103
LDI r9, 0x200B
STORE r9, r1
LDI r1, 46
LDI r9, 0x200C
STORE r9, r1
LDI r1, 112
LDI r9, 0x200D
STORE r9, r1
LDI r1, 110
LDI r9, 0x200E
STORE r9, r1
LDI r1, 103
LDI r9, 0x200F
STORE r9, r1
LDI r1, 0
LDI r9, 0x2010
STORE r9, r1    ; null terminator

; Draw colored rectangles
LDI r1, 0x00FF0000   ; red
LDI r2, 10
LDI r3, 10
LDI r4, 60
LDI r5, 40
RECT r2, r3, r4, r5, r1

LDI r1, 0x0000FF00   ; green
LDI r2, 80
LDI r3, 10
LDI r4, 60
LDI r5, 40
RECT r2, r3, r4, r5, r1

LDI r1, 0x000000FF   ; blue
LDI r2, 10
LDI r3, 70
LDI r4, 60
LDI r5, 40
RECT r2, r3, r4, r5, r1

LDI r1, 0x00FFFF00   ; yellow
LDI r2, 80
LDI r3, 70
LDI r4, 60
LDI r5, 40
RECT r2, r3, r4, r5, r1

; Draw text label
LDI r1, 50
LDI r2, 125
LDI r3, 0x2000      ; filename address
LDI r4, 0xFFFFFF
LDI r5, 0
VWTXT r1, r2, r3, r4, r5

; Export screen as PNG
LDI r1, 0x2000
SAVEPNG r1

; r0 = bytes written (or 0xFFFFFFFF on error)
HALT
