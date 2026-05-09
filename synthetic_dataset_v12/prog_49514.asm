; DESCRIPTION: Renders a purple box of size 47x72 starting at (51, 121).
; PLAN: r0=51(x), r1=121(y), r2=47(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 121
LDI r2, 47
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
