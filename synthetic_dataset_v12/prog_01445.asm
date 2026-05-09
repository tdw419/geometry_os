; DESCRIPTION: Draws a black rectangle at (175, 88) with width 98 and height 109.
; PLAN: r0=175(x), r1=88(y), r2=98(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 88
LDI r2, 98
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
