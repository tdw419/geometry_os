; DESCRIPTION: Draws a white rectangle at (24, 88) with width 39 and height 33.
; PLAN: r0=24(x), r1=88(y), r2=39(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 88
LDI r2, 39
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
