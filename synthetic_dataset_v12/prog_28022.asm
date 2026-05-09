; DESCRIPTION: Draws a black rectangle at (24, 29) with width 34 and height 105.
; PLAN: r0=24(x), r1=29(y), r2=34(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 29
LDI r2, 34
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
