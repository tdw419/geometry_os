; DESCRIPTION: Draws a red rectangle at (62, 147) with width 15 and height 49.
; PLAN: r0=62(x), r1=147(y), r2=15(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 147
LDI r2, 15
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
