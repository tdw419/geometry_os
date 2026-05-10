; DESCRIPTION: Creates a white filled rectangle of size 23x62 starting at (138, 162).
; PLAN: r0=138(x), r1=162(y), r2=23(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 162
LDI r2, 23
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
