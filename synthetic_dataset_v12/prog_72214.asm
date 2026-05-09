; DESCRIPTION: Draws a orange rectangle at (310, 196) with width 29 and height 35.
; PLAN: r0=310(x), r1=196(y), r2=29(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 196
LDI r2, 29
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
