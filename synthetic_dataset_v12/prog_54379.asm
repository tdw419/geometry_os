; DESCRIPTION: Draws a orange rectangle at (293, 125) with width 15 and height 36.
; PLAN: r0=293(x), r1=125(y), r2=15(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 125
LDI r2, 15
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
