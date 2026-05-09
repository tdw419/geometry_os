; DESCRIPTION: Renders a purple box of size 10x56 starting at (51, 182).
; PLAN: r0=51(x), r1=182(y), r2=10(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 182
LDI r2, 10
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
