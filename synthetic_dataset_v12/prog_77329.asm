; DESCRIPTION: Draws a red rectangle at (348, 75) with width 97 and height 15.
; PLAN: r0=348(x), r1=75(y), r2=97(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 75
LDI r2, 97
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
