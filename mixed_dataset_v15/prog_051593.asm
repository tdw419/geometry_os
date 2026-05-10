; DESCRIPTION: Creates a green filled rectangle of size 75x45 starting at (397, 99).
; PLAN: r0=397(x), r1=99(y), r2=75(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 99
LDI r2, 75
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
