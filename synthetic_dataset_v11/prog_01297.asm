; DESCRIPTION: Renders a purple box of size 88x58 starting at (52, 58).
; PLAN: r0=52(x), r1=58(y), r2=88(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 58
LDI r2, 88
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
