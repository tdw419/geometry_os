; DESCRIPTION: Creates a green filled rectangle of size 78x110 starting at (376, 37).
; PLAN: r0=376(x), r1=37(y), r2=78(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 37
LDI r2, 78
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
