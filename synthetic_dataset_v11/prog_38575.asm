; DESCRIPTION: Renders a purple box of size 45x68 starting at (185, 89).
; PLAN: r0=185(x), r1=89(y), r2=45(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 89
LDI r2, 45
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
