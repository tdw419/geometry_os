; DESCRIPTION: Creates a yellow filled rectangle of size 83x99 starting at (40, 129).
; PLAN: r0=40(x), r1=129(y), r2=83(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 129
LDI r2, 83
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
