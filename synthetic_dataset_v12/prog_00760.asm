; DESCRIPTION: Creates a yellow circular shape at (141, 129) with radius 49.
; PLAN: r0=141(x), r1=129(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 129
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
