; DESCRIPTION: Draws a magenta rectangle at (83, 45) with width 34 and height 46.
; PLAN: r0=83(x), r1=45(y), r2=34(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 45
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
