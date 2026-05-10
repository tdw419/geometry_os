; DESCRIPTION: Draws a black rectangle at (315, 189) with width 118 and height 60.
; PLAN: r0=315(x), r1=189(y), r2=118(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 189
LDI r2, 118
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
