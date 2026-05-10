; DESCRIPTION: Creates a yellow filled rectangle of size 52x87 starting at (339, 123).
; PLAN: r0=339(x), r1=123(y), r2=52(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 123
LDI r2, 52
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
