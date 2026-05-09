; DESCRIPTION: Draws a white rectangle at (147, 43) with width 87 and height 51.
; PLAN: r0=147(x), r1=43(y), r2=87(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 43
LDI r2, 87
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
