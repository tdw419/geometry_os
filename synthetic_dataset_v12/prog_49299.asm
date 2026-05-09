; DESCRIPTION: Renders a purple box of size 15x114 starting at (312, 17).
; PLAN: r0=312(x), r1=17(y), r2=15(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 17
LDI r2, 15
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
