; DESCRIPTION: Renders a purple box of size 26x106 starting at (161, 48).
; PLAN: r0=161(x), r1=48(y), r2=26(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 48
LDI r2, 26
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
