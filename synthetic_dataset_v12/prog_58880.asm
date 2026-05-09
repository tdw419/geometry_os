; DESCRIPTION: Draws a white rectangle at (406, 49) with width 19 and height 89.
; PLAN: r0=406(x), r1=49(y), r2=19(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 49
LDI r2, 19
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
