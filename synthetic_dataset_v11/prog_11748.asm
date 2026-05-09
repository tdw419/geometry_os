; DESCRIPTION: Renders a purple box of size 109x38 starting at (15, 155).
; PLAN: r0=15(x), r1=155(y), r2=109(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 155
LDI r2, 109
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
