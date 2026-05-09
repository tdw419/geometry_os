; DESCRIPTION: Draws a white rectangle at (453, 102) with width 51 and height 45.
; PLAN: r0=453(x), r1=102(y), r2=51(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 102
LDI r2, 51
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
