; DESCRIPTION: Creates a yellow filled rectangle of size 83x101 starting at (195, 141).
; PLAN: r0=195(x), r1=141(y), r2=83(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 141
LDI r2, 83
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
