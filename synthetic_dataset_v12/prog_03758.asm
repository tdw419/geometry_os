; DESCRIPTION: Draws a white rectangle at (86, 147) with width 69 and height 13.
; PLAN: r0=86(x), r1=147(y), r2=69(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 147
LDI r2, 69
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
