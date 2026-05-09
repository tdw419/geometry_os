; DESCRIPTION: Draws a white rectangle at (11, 99) with width 73 and height 36.
; PLAN: r0=11(x), r1=99(y), r2=73(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 99
LDI r2, 73
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
