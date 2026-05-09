; DESCRIPTION: Draws a magenta rectangle at (364, 137) with width 36 and height 45.
; PLAN: r0=364(x), r1=137(y), r2=36(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 137
LDI r2, 36
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
