; DESCRIPTION: Renders a purple box of size 88x51 starting at (53, 126).
; PLAN: r0=53(x), r1=126(y), r2=88(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 126
LDI r2, 88
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
