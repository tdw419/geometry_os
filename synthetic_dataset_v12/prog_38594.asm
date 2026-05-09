; DESCRIPTION: Draws a white rectangle at (454, 147) with width 37 and height 91.
; PLAN: r0=454(x), r1=147(y), r2=37(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 147
LDI r2, 37
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
