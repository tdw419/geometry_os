; DESCRIPTION: Draws a white rectangle at (8, 54) with width 99 and height 26.
; PLAN: r0=8(x), r1=54(y), r2=99(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 54
LDI r2, 99
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
