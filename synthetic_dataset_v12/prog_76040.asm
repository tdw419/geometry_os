; DESCRIPTION: Draws a black rectangle at (175, 156) with width 60 and height 74.
; PLAN: r0=175(x), r1=156(y), r2=60(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 156
LDI r2, 60
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
