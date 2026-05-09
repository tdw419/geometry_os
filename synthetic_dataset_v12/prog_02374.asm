; DESCRIPTION: Renders a purple box of size 30x19 starting at (25, 58).
; PLAN: r0=25(x), r1=58(y), r2=30(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 58
LDI r2, 30
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
