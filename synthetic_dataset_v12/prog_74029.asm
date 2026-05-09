; DESCRIPTION: Renders a purple box of size 71x13 starting at (115, 114).
; PLAN: r0=115(x), r1=114(y), r2=71(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 114
LDI r2, 71
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
