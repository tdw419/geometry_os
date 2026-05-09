; DESCRIPTION: Draws a green rectangle at (130, 106) with width 26 and height 61.
; PLAN: r0=130(x), r1=106(y), r2=26(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 106
LDI r2, 26
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
