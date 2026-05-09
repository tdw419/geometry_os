; DESCRIPTION: Draws a orange rectangle at (76, 172) with width 52 and height 74.
; PLAN: r0=76(x), r1=172(y), r2=52(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 172
LDI r2, 52
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
