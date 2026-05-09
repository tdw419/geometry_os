; DESCRIPTION: Renders a purple box of size 119x79 starting at (46, 158).
; PLAN: r0=46(x), r1=158(y), r2=119(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 158
LDI r2, 119
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
