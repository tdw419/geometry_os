; DESCRIPTION: Draws a green rectangle at (399, 109) with width 54 and height 31.
; PLAN: r0=399(x), r1=109(y), r2=54(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 109
LDI r2, 54
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
