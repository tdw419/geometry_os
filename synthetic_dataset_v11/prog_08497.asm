; DESCRIPTION: Draws a blue rectangle at (191, 51) with width 40 and height 69.
; PLAN: r0=191(x), r1=51(y), r2=40(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 51
LDI r2, 40
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
