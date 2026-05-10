; DESCRIPTION: Draws a yellow rectangle at (348, 155) with width 78 and height 61.
; PLAN: r0=348(x), r1=155(y), r2=78(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 155
LDI r2, 78
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
