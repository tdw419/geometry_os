; DESCRIPTION: Renders a purple box of size 119x117 starting at (19, 102).
; PLAN: r0=19(x), r1=102(y), r2=119(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 102
LDI r2, 119
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
