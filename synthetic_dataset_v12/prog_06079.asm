; DESCRIPTION: Draws a white rectangle at (227, 205) with width 51 and height 49.
; PLAN: r0=227(x), r1=205(y), r2=51(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 205
LDI r2, 51
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
