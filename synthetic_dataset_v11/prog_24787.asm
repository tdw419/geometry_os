; DESCRIPTION: Renders a purple box of size 51x57 starting at (133, 194).
; PLAN: r0=133(x), r1=194(y), r2=51(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 194
LDI r2, 51
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
