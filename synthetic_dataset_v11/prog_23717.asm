; DESCRIPTION: Renders a purple box of size 30x58 starting at (97, 170).
; PLAN: r0=97(x), r1=170(y), r2=30(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 170
LDI r2, 30
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
