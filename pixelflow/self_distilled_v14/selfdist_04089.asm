; DESCRIPTION: Creates a yellow filled rectangle of size 43x33 starting at (62, 4).
; PLAN: r0=62(x), r1=4(y), r2=43(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 4
LDI r2, 43
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
