; DESCRIPTION: Draws a black rectangle at (125, 29) with width 48 and height 66.
; PLAN: r0=125(x), r1=29(y), r2=48(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 29
LDI r2, 48
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
