; DESCRIPTION: Draws a green rectangle at (97, 85) with width 36 and height 80.
; PLAN: r0=97(x), r1=85(y), r2=36(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 85
LDI r2, 36
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
