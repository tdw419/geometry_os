; DESCRIPTION: Renders a purple box of size 85x79 starting at (133, 23).
; PLAN: r0=133(x), r1=23(y), r2=85(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 23
LDI r2, 85
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
