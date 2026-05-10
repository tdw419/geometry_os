; DESCRIPTION: Draws a blue rectangle at (172, 161) with width 11 and height 51.
; PLAN: r0=172(x), r1=161(y), r2=11(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 161
LDI r2, 11
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
