; DESCRIPTION: Creates a yellow filled rectangle of size 99x43 starting at (274, 12).
; PLAN: r0=274(x), r1=12(y), r2=99(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 12
LDI r2, 99
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
