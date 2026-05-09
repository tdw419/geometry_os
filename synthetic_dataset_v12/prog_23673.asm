; DESCRIPTION: Renders a purple box of size 18x104 starting at (112, 104).
; PLAN: r0=112(x), r1=104(y), r2=18(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 104
LDI r2, 18
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
