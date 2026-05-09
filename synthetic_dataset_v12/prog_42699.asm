; DESCRIPTION: Renders a purple box of size 70x97 starting at (430, 130).
; PLAN: r0=430(x), r1=130(y), r2=70(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 130
LDI r2, 70
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
