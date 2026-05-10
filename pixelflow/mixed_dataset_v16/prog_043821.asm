; DESCRIPTION: Creates a purple filled rectangle of size 71x110 starting at (164, 72).
; PLAN: r0=164(x), r1=72(y), r2=71(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 72
LDI r2, 71
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
