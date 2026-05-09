; DESCRIPTION: Renders a purple box of size 31x69 starting at (182, 3).
; PLAN: r0=182(x), r1=3(y), r2=31(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 31
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
