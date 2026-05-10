; DESCRIPTION: Creates a yellow filled rectangle of size 31x14 starting at (153, 181).
; PLAN: r0=153(x), r1=181(y), r2=31(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 181
LDI r2, 31
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
