; DESCRIPTION: Draws a red rectangle at (147, 49) with width 21 and height 38.
; PLAN: r0=147(x), r1=49(y), r2=21(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 49
LDI r2, 21
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
