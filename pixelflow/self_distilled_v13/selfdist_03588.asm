; DESCRIPTION: Creates a yellow filled rectangle of size 78x18 starting at (221, 3).
; PLAN: r0=221(x), r1=3(y), r2=78(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 3
LDI r2, 78
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
