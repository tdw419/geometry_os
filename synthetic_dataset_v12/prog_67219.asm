; DESCRIPTION: Draws a white rectangle at (418, 155) with width 22 and height 51.
; PLAN: r0=418(x), r1=155(y), r2=22(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 155
LDI r2, 22
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
