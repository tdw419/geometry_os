; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r0, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r1, 'd'
STOR [0x2000], r1
LDI r1, 'e'
STOR [0x2001], r1
LDI r1, 'm'
STOR [0x2002], r1
LDI r1, 'o'
STOR [0x2003], r1
LDI r1, '_'
STOR [0x2004], r1
LDI r1, 's'
STOR [0x2005], r1
LDI r1, 'a'
STOR [0x2006], r1
LDI r1, 'v'
STOR [0x2007], r1
LDI r1, 'e'
STOR [0x2008], r1
LDI r1, 'p'
STOR [0x2009], r1
LDI r1, 'n'
STOR [0x200A], r1
LDI r1, 'g'
STOR [0x200B], r1
LDI r1, '.'
STOR [0x200C], r1
LDI r1, 'p'
STOR [0x200D], r1
LDI r1, 'n'
STOR [0x200E], r1
LDI r1, 'g'
STOR [0x200F], r1
LDI r1, 0
STOR [0x2010], r1    ; null terminator

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
