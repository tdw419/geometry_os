; DESCRIPTION: Render a colored rectangle at the screen.

; ── Phase 212 Demo: SAVEPNG Opcode ──
; Draws a colorful pattern on screen, then exports as PNG via SAVEPNG (0xAF)
;
; SAVEPNG path_addr_reg  -- saves current screen as PNG to VFS file
; Returns bytes written in r0, or 0xFFFFFFFF on error

; Store filename "demo_savepng.png" at 0x2000
LDI r6, 100
LDI r7, 0x2000
STORE r7, r6
LDI r6, 101
LDI r7, 0x2001
STORE r7, r6
LDI r6, 109
LDI r7, 0x2002
STORE r7, r6
LDI r6, 111
LDI r7, 0x2003
STORE r7, r6
LDI r6, 95
LDI r7, 0x2004
STORE r7, r6
LDI r6, 115
LDI r7, 0x2005
STORE r7, r6
LDI r6, 97
LDI r7, 0x2006
STORE r7, r6
LDI r6, 118
LDI r7, 0x2007
STORE r7, r6
LDI r6, 101
LDI r7, 0x2008
STORE r7, r6
LDI r6, 112
LDI r7, 0x2009
STORE r7, r6
LDI r6, 110
LDI r7, 0x200A
STORE r7, r6
LDI r6, 103
LDI r7, 0x200B
STORE r7, r6
LDI r6, 46
LDI r7, 0x200C
STORE r7, r6
LDI r6, 112
LDI r7, 0x200D
STORE r7, r6
LDI r6, 110
LDI r7, 0x200E
STORE r7, r6
LDI r6, 103
LDI r7, 0x200F
STORE r7, r6
LDI r6, 0
LDI r7, 0x2010
STORE r7, r6    ; null terminator

; Draw colored rectangles
LDI r6, 0x00FF0000   ; red
LDI r14, 10
LDI r8, 10
LDI r9, 60
LDI r3, 40
RECT r14, r8, r9, r3, r6

LDI r6, 0x0000FF00   ; green
LDI r14, 80
LDI r8, 10
LDI r9, 60
LDI r3, 40
RECT r14, r8, r9, r3, r6

LDI r6, 0x000000FF   ; blue
LDI r14, 10
LDI r8, 70
LDI r9, 60
LDI r3, 40
RECT r14, r8, r9, r3, r6

LDI r6, 0x00FFFF00   ; yellow
LDI r14, 80
LDI r8, 70
LDI r9, 60
LDI r3, 40
RECT r14, r8, r9, r3, r6

; Draw text label
LDI r6, 50
LDI r14, 125
LDI r8, 0x2000      ; filename address
LDI r9, 0xFFFFFF
LDI r3, 0
VWTXT r6, r14, r8, r9, r3

; Export screen as PNG
LDI r6, 0x2000
SAVEPNG r6

; r0 = bytes written (or 0xFFFFFFFF on error)
HALT
