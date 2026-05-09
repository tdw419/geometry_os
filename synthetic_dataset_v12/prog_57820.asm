; DESCRIPTION: Renders a purple box of size 51x73 starting at (164, 136).
; PLAN: r0=164(x), r1=136(y), r2=51(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 136
LDI r2, 51
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
