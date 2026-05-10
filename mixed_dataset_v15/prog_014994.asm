; DESCRIPTION: Draws a black rectangle at (219, 103) with width 117 and height 119.
; PLAN: r0=219(x), r1=103(y), r2=117(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 103
LDI r2, 117
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
