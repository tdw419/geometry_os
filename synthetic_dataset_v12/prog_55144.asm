; DESCRIPTION: Renders a purple box of size 119x92 starting at (101, 76).
; PLAN: r0=101(x), r1=76(y), r2=119(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 76
LDI r2, 119
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
