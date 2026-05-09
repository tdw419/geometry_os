; DESCRIPTION: Renders a purple box of size 51x73 starting at (20, 183).
; PLAN: r0=20(x), r1=183(y), r2=51(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 183
LDI r2, 51
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
