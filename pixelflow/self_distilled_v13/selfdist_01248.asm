; DESCRIPTION: Creates a yellow filled rectangle of size 52x37 starting at (58, 138).
; PLAN: r0=58(x), r1=138(y), r2=52(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 138
LDI r2, 52
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
