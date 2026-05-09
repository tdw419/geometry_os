; DESCRIPTION: Renders a purple box of size 51x60 starting at (432, 155).
; PLAN: r0=432(x), r1=155(y), r2=51(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 155
LDI r2, 51
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
