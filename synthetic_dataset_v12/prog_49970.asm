; DESCRIPTION: Draws a magenta rectangle at (83, 123) with width 30 and height 90.
; PLAN: r0=83(x), r1=123(y), r2=30(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 123
LDI r2, 30
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
