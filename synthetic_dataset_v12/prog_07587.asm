; DESCRIPTION: Renders a purple box of size 69x118 starting at (112, 95).
; PLAN: r0=112(x), r1=95(y), r2=69(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 95
LDI r2, 69
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
