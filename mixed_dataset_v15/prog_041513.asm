; DESCRIPTION: Creates a green filled rectangle of size 89x56 starting at (110, 102).
; PLAN: r0=110(x), r1=102(y), r2=89(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 102
LDI r2, 89
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
