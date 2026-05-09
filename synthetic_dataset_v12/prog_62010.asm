; DESCRIPTION: Renders a purple box of size 112x51 starting at (133, 171).
; PLAN: r0=133(x), r1=171(y), r2=112(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 171
LDI r2, 112
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
