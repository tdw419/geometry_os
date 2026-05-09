; DESCRIPTION: Renders a purple box of size 24x34 starting at (8, 106).
; PLAN: r0=8(x), r1=106(y), r2=24(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 106
LDI r2, 24
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
