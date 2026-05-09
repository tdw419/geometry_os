; DESCRIPTION: Renders a purple box of size 73x22 starting at (309, 78).
; PLAN: r0=309(x), r1=78(y), r2=73(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 78
LDI r2, 73
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
