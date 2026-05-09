; DESCRIPTION: Draws a black rectangle at (135, 5) with width 115 and height 119.
; PLAN: r0=135(x), r1=5(y), r2=115(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 5
LDI r2, 115
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
