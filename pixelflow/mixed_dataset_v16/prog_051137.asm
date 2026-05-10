; DESCRIPTION: Draws a magenta rectangle at (26, 118) with width 33 and height 32.
; PLAN: r0=26(x), r1=118(y), r2=33(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 118
LDI r2, 33
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
