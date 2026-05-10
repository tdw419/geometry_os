; DESCRIPTION: Creates a white filled rectangle of size 101x118 starting at (149, 137).
; PLAN: r0=149(x), r1=137(y), r2=101(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 137
LDI r2, 101
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
