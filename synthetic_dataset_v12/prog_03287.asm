; DESCRIPTION: Draws a green rectangle at (363, 15) with width 26 and height 34.
; PLAN: r0=363(x), r1=15(y), r2=26(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 15
LDI r2, 26
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
