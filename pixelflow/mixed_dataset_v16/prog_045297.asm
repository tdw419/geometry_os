; DESCRIPTION: Creates a yellow filled rectangle of size 81x21 starting at (266, 165).
; PLAN: r0=266(x), r1=165(y), r2=81(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 165
LDI r2, 81
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
