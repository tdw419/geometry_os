; DESCRIPTION: Draws a black rectangle at (76, 31) with width 119 and height 10.
; PLAN: r0=76(x), r1=31(y), r2=119(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 31
LDI r2, 119
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
