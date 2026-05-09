; DESCRIPTION: Draws a white rectangle at (147, 72) with width 75 and height 74.
; PLAN: r0=147(x), r1=72(y), r2=75(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 72
LDI r2, 75
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
