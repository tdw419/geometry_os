; DESCRIPTION: Renders a purple box of size 68x58 starting at (132, 35).
; PLAN: r0=132(x), r1=35(y), r2=68(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 35
LDI r2, 68
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
