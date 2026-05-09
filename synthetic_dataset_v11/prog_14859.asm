; DESCRIPTION: Draws a white rectangle at (92, 147) with width 35 and height 91.
; PLAN: r0=92(x), r1=147(y), r2=35(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 147
LDI r2, 35
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
