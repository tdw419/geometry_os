; DESCRIPTION: Creates a blue filled rectangle of size 119x19 starting at (397, 106).
; PLAN: r0=397(x), r1=106(y), r2=119(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 106
LDI r2, 119
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
