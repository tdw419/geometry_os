; DESCRIPTION: Draws a black rectangle at (276, 165) with width 37 and height 88.
; PLAN: r0=276(x), r1=165(y), r2=37(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 165
LDI r2, 37
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
