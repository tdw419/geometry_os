; DESCRIPTION: Draws a white rectangle at (130, 136) with width 102 and height 36.
; PLAN: r0=130(x), r1=136(y), r2=102(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 136
LDI r2, 102
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
