; Red cross/plus sign centered on 256x256 screen
; Vertical bar: rect at (120, 40) w=16 h=176
; Horizontal bar: rect at (40, 120) w=176 h=16

LDI r4, 0xFF0000       ; red color

; Vertical bar
LDI r0, 120
LDI r1, 40
LDI r2, 16
LDI r3, 176
RECTF r0, r1, r2, r3, r4

; Horizontal bar
LDI r0, 40
LDI r1, 120
LDI r2, 176
LDI r3, 16
RECTF r0, r1, r2, r3, r4

HALT
