; DESCRIPTION: Renders a purple box of size 33x89 starting at (123, 104).
; PLAN: r0=123(x), r1=104(y), r2=33(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 104
LDI r2, 33
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
