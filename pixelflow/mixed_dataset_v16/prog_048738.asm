; DESCRIPTION: Draws a green rectangle at (269, 112) with width 43 and height 118.
; PLAN: r0=269(x), r1=112(y), r2=43(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 112
LDI r2, 43
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
