; DESCRIPTION: Creates a red circular shape at (139, 192) with radius 45.
; PLAN: r0=139(x), r1=192(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 192
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
