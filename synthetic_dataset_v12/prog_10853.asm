; DESCRIPTION: Renders a purple box of size 50x89 starting at (158, 73).
; PLAN: r0=158(x), r1=73(y), r2=50(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 73
LDI r2, 50
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
