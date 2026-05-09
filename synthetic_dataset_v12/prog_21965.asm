; DESCRIPTION: Renders a purple box of size 89x12 starting at (373, 114).
; PLAN: r0=373(x), r1=114(y), r2=89(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 114
LDI r2, 89
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
