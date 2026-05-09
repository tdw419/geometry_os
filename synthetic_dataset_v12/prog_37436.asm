; DESCRIPTION: Renders a purple box of size 26x114 starting at (432, 80).
; PLAN: r0=432(x), r1=80(y), r2=26(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 80
LDI r2, 26
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
