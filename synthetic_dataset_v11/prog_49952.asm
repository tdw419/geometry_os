; DESCRIPTION: Draws a black rectangle at (44, 119) with width 115 and height 98.
; PLAN: r0=44(x), r1=119(y), r2=115(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 119
LDI r2, 115
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
