; DESCRIPTION: Draws a orange rectangle at (348, 66) with width 63 and height 15.
; PLAN: r0=348(x), r1=66(y), r2=63(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 66
LDI r2, 63
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
