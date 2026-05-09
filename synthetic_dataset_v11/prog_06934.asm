; DESCRIPTION: Renders a blue box of size 109x97 starting at (49, 43).
; PLAN: r0=49(x), r1=43(y), r2=109(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 43
LDI r2, 109
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
