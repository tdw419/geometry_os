; DESCRIPTION: Renders a purple box of size 74x37 starting at (56, 170).
; PLAN: r0=56(x), r1=170(y), r2=74(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 170
LDI r2, 74
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
