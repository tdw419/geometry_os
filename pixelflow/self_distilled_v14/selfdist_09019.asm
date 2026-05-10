; DESCRIPTION: Creates a green filled rectangle of size 73x76 starting at (231, 66).
; PLAN: r0=231(x), r1=66(y), r2=73(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 66
LDI r2, 73
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
