; DESCRIPTION: Draws a blue rectangle at (312, 18) with width 27 and height 119.
; PLAN: r0=312(x), r1=18(y), r2=27(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 18
LDI r2, 27
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
