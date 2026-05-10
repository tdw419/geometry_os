; DESCRIPTION: Creates a green filled rectangle of size 73x62 starting at (87, 88).
; PLAN: r0=87(x), r1=88(y), r2=73(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 88
LDI r2, 73
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
