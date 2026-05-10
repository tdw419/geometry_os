; DESCRIPTION: Creates a purple circular shape at (274, 165) with radius 62.
; PLAN: r0=274(x), r1=165(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 165
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
