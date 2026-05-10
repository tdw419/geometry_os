; DESCRIPTION: Renders a purple box of size 36x66 starting at (258, 145).
; PLAN: r0=258(x), r1=145(y), r2=36(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 145
LDI r2, 36
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
