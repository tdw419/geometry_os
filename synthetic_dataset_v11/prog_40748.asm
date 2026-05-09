; DESCRIPTION: Creates a red circular shape at (62, 68) with radius 38.
; PLAN: r0=62(x), r1=68(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 68
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
