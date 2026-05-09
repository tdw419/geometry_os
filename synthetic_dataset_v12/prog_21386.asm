; DESCRIPTION: Draws a black rectangle at (381, 24) with width 37 and height 49.
; PLAN: r0=381(x), r1=24(y), r2=37(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 24
LDI r2, 37
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
