; DESCRIPTION: Draws a orange rectangle at (165, 22) with width 80 and height 119.
; PLAN: r0=165(x), r1=22(y), r2=80(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 22
LDI r2, 80
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
