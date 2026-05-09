; DESCRIPTION: Draws a green rectangle at (34, 54) with width 100 and height 86.
; PLAN: r0=34(x), r1=54(y), r2=100(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 54
LDI r2, 100
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
