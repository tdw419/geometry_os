; DESCRIPTION: Draws a green rectangle at (54, 91) with width 34 and height 54.
; PLAN: r0=54(x), r1=91(y), r2=34(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 91
LDI r2, 34
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
