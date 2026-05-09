; DESCRIPTION: Renders a purple box of size 10x89 starting at (79, 79).
; PLAN: r0=79(x), r1=79(y), r2=10(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 79
LDI r2, 10
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
