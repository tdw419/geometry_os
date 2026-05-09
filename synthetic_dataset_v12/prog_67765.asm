; DESCRIPTION: Draws a black rectangle at (98, 137) with width 61 and height 119.
; PLAN: r0=98(x), r1=137(y), r2=61(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 137
LDI r2, 61
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
