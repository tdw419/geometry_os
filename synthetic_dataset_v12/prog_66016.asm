; DESCRIPTION: Draws a green rectangle at (391, 176) with width 97 and height 54.
; PLAN: r0=391(x), r1=176(y), r2=97(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 176
LDI r2, 97
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
