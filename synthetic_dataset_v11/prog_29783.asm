; DESCRIPTION: Draws a white rectangle at (124, 161) with width 96 and height 25.
; PLAN: r0=124(x), r1=161(y), r2=96(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 161
LDI r2, 96
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
