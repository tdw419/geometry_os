; DESCRIPTION: Creates a red filled rectangle of size 62x110 starting at (49, 80).
; PLAN: r0=49(x), r1=80(y), r2=62(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 80
LDI r2, 62
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
