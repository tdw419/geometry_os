; DESCRIPTION: Draws a black rectangle at (351, 114) with width 27 and height 20.
; PLAN: r0=351(x), r1=114(y), r2=27(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 114
LDI r2, 27
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
