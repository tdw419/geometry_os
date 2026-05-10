; DESCRIPTION: Renders a purple box of size 25x51 starting at (315, 51).
; PLAN: r0=315(x), r1=51(y), r2=25(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 51
LDI r2, 25
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
