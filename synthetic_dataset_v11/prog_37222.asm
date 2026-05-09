; DESCRIPTION: Draws a green rectangle at (40, 26) with width 21 and height 119.
; PLAN: r0=40(x), r1=26(y), r2=21(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 26
LDI r2, 21
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
