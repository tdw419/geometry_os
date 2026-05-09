; DESCRIPTION: Renders a purple box of size 31x120 starting at (341, 1).
; PLAN: r0=341(x), r1=1(y), r2=31(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 1
LDI r2, 31
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
