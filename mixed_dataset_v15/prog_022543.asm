; DESCRIPTION: Creates a yellow circular shape at (437, 184) with radius 26.
; PLAN: r0=437(x), r1=184(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 184
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
