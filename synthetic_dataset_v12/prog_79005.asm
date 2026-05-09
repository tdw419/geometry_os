; DESCRIPTION: Renders a purple box of size 99x119 starting at (33, 34).
; PLAN: r0=33(x), r1=34(y), r2=99(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 34
LDI r2, 99
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
