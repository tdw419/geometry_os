; DESCRIPTION: Draws a blue rectangle at (9, 112) with width 58 and height 51.
; PLAN: r0=9(x), r1=112(y), r2=58(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 112
LDI r2, 58
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
