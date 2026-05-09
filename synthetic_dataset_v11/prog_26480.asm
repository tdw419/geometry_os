; DESCRIPTION: Draws a black rectangle at (114, 37) with width 31 and height 60.
; PLAN: r0=114(x), r1=37(y), r2=31(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 37
LDI r2, 31
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
