; DESCRIPTION: Draws a white rectangle at (0, 33) with width 73 and height 119.
; PLAN: r0=0(x), r1=33(y), r2=73(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 33
LDI r2, 73
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
