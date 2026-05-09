; DESCRIPTION: Draws a magenta rectangle at (211, 157) with width 36 and height 65.
; PLAN: r0=211(x), r1=157(y), r2=36(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 157
LDI r2, 36
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
