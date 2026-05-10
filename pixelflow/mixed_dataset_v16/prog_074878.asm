; DESCRIPTION: Renders a purple box of size 105x94 starting at (172, 105).
; PLAN: r0=172(x), r1=105(y), r2=105(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 105
LDI r2, 105
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
