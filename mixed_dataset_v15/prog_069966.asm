; DESCRIPTION: Creates a blue filled rectangle of size 119x70 starting at (100, 157).
; PLAN: r0=100(x), r1=157(y), r2=119(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 157
LDI r2, 119
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
