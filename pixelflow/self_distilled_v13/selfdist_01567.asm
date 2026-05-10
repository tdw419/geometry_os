; DESCRIPTION: Creates a yellow filled rectangle of size 102x85 starting at (363, 26).
; PLAN: r0=363(x), r1=26(y), r2=102(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 26
LDI r2, 102
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
