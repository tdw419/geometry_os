; DESCRIPTION: Draws a orange rectangle at (254, 137) with width 25 and height 119.
; PLAN: r0=254(x), r1=137(y), r2=25(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 137
LDI r2, 25
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
