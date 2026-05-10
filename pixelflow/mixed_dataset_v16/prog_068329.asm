; DESCRIPTION: Draws a yellow rectangle at (348, 2) with width 110 and height 85.
; PLAN: r0=348(x), r1=2(y), r2=110(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 2
LDI r2, 110
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
