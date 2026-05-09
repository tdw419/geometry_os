; DESCRIPTION: Renders a purple box of size 109x85 starting at (105, 106).
; PLAN: r0=105(x), r1=106(y), r2=109(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 106
LDI r2, 109
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
