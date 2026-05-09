; DESCRIPTION: Renders a purple box of size 49x79 starting at (431, 69).
; PLAN: r0=431(x), r1=69(y), r2=49(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 69
LDI r2, 49
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
