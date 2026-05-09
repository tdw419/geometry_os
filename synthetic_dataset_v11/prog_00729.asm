; DESCRIPTION: Renders a purple box of size 84x51 starting at (159, 155).
; PLAN: r0=159(x), r1=155(y), r2=84(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 155
LDI r2, 84
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
