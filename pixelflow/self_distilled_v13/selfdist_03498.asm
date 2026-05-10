; DESCRIPTION: Creates a green filled rectangle of size 52x99 starting at (34, 38).
; PLAN: r0=34(x), r1=38(y), r2=52(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 38
LDI r2, 52
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
