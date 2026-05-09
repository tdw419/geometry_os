; DESCRIPTION: Draws a orange rectangle at (381, 1) with width 105 and height 77.
; PLAN: r0=381(x), r1=1(y), r2=105(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 1
LDI r2, 105
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
