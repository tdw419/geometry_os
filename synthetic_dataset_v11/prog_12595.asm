; DESCRIPTION: Renders a purple box of size 118x19 starting at (12, 58).
; PLAN: r0=12(x), r1=58(y), r2=118(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 58
LDI r2, 118
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
