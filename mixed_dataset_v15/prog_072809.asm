; DESCRIPTION: Creates a purple filled rectangle of size 108x85 starting at (225, 88).
; PLAN: r0=225(x), r1=88(y), r2=108(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 88
LDI r2, 108
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
