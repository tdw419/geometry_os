; DESCRIPTION: Draws a magenta rectangle at (144, 193) with width 26 and height 47.
; PLAN: r0=144(x), r1=193(y), r2=26(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 193
LDI r2, 26
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
