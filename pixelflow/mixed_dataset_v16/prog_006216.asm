; DESCRIPTION: Renders a purple box of size 26x104 starting at (423, 32).
; PLAN: r0=423(x), r1=32(y), r2=26(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 32
LDI r2, 26
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
