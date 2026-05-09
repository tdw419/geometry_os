; DESCRIPTION: Renders a purple box of size 109x114 starting at (95, 109).
; PLAN: r0=95(x), r1=109(y), r2=109(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 109
LDI r2, 109
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
