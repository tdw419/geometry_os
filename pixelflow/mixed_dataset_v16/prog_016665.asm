; DESCRIPTION: Draws a black rectangle at (272, 69) with width 110 and height 107.
; PLAN: r0=272(x), r1=69(y), r2=110(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 69
LDI r2, 110
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
