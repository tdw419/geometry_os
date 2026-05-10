; DESCRIPTION: Creates a green filled rectangle of size 31x26 starting at (379, 161).
; PLAN: r0=379(x), r1=161(y), r2=31(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 161
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
