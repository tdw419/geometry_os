; DESCRIPTION: Creates a yellow circular shape at (177, 68) with radius 62.
; PLAN: r0=177(x), r1=68(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 68
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
