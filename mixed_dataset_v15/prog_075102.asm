; DESCRIPTION: Draws a black rectangle at (119, 107) with width 44 and height 43.
; PLAN: r0=119(x), r1=107(y), r2=44(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 107
LDI r2, 44
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
