; DESCRIPTION: Creates a yellow filled rectangle of size 91x118 starting at (190, 141).
; PLAN: r0=190(x), r1=141(y), r2=91(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 141
LDI r2, 91
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
