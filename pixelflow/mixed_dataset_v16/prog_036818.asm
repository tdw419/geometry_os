; DESCRIPTION: Draws a green rectangle at (370, 54) with width 91 and height 84.
; PLAN: r0=370(x), r1=54(y), r2=91(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 54
LDI r2, 91
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
