; DESCRIPTION: Renders a purple box of size 72x105 starting at (97, 110).
; PLAN: r0=97(x), r1=110(y), r2=72(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 110
LDI r2, 72
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
