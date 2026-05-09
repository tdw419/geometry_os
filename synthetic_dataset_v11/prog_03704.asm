; DESCRIPTION: Renders a purple box of size 109x11 starting at (53, 78).
; PLAN: r0=53(x), r1=78(y), r2=109(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 78
LDI r2, 109
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
