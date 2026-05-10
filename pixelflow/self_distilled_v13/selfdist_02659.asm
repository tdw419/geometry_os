; DESCRIPTION: Creates a yellow filled rectangle of size 99x52 starting at (189, 78).
; PLAN: r0=189(x), r1=78(y), r2=99(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 78
LDI r2, 99
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
