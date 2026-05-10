; DESCRIPTION: Draws a green rectangle at (87, 147) with width 78 and height 71.
; PLAN: r0=87(x), r1=147(y), r2=78(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 147
LDI r2, 78
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
