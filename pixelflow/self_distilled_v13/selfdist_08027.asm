; DESCRIPTION: Creates a yellow filled rectangle of size 26x26 starting at (335, 39).
; PLAN: r0=335(x), r1=39(y), r2=26(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 39
LDI r2, 26
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
