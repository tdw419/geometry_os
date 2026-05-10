; DESCRIPTION: Creates a yellow filled rectangle of size 26x61 starting at (220, 129).
; PLAN: r0=220(x), r1=129(y), r2=26(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 129
LDI r2, 26
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
