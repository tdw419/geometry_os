; DESCRIPTION: Creates a purple filled rectangle of size 118x31 starting at (134, 36).
; PLAN: r0=134(x), r1=36(y), r2=118(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 36
LDI r2, 118
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
