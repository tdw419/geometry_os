; DESCRIPTION: Renders a purple box of size 115x97 starting at (86, 3).
; PLAN: r0=86(x), r1=3(y), r2=115(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 3
LDI r2, 115
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
