; DESCRIPTION: Renders a purple box of size 79x100 starting at (96, 85).
; PLAN: r0=96(x), r1=85(y), r2=79(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 85
LDI r2, 79
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
