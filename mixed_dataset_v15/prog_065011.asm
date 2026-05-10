; DESCRIPTION: Draws a black rectangle at (32, 119) with width 31 and height 119.
; PLAN: r0=32(x), r1=119(y), r2=31(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 119
LDI r2, 31
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
