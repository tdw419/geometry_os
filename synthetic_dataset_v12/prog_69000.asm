; DESCRIPTION: Renders a purple box of size 114x110 starting at (368, 137).
; PLAN: r0=368(x), r1=137(y), r2=114(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 137
LDI r2, 114
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
