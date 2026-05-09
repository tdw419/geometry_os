; DESCRIPTION: Renders a purple box of size 38x69 starting at (34, 35).
; PLAN: r0=34(x), r1=35(y), r2=38(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 35
LDI r2, 38
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
