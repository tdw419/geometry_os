; DESCRIPTION: Creates a yellow circular shape at (62, 168) with radius 34.
; PLAN: r0=62(x), r1=168(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 168
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
