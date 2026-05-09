; DESCRIPTION: Draws a green rectangle at (323, 49) with width 43 and height 92.
; PLAN: r0=323(x), r1=49(y), r2=43(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 49
LDI r2, 43
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
