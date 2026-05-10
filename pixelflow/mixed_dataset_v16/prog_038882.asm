; DESCRIPTION: Renders a purple box of size 26x119 starting at (9, 135).
; PLAN: r0=9(x), r1=135(y), r2=26(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 135
LDI r2, 26
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
