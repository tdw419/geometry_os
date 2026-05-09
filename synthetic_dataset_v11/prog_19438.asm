; DESCRIPTION: Draws a black rectangle at (118, 77) with width 49 and height 60.
; PLAN: r0=118(x), r1=77(y), r2=49(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 77
LDI r2, 49
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
