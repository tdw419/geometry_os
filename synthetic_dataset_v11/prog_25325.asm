; DESCRIPTION: Renders a purple box of size 79x107 starting at (139, 34).
; PLAN: r0=139(x), r1=34(y), r2=79(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 34
LDI r2, 79
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
