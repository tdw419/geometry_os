; DESCRIPTION: Creates a purple filled rectangle of size 95x95 starting at (78, 140).
; PLAN: r0=78(x), r1=140(y), r2=95(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 140
LDI r2, 95
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
