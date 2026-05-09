; DESCRIPTION: Draws a magenta rectangle at (335, 5) with width 35 and height 31.
; PLAN: r0=335(x), r1=5(y), r2=35(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 5
LDI r2, 35
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
