; DESCRIPTION: Draws a magenta rectangle at (348, 18) with width 105 and height 108.
; PLAN: r0=348(x), r1=18(y), r2=105(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 18
LDI r2, 105
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
