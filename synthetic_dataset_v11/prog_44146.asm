; DESCRIPTION: Creates a purple circular shape at (114, 129) with radius 78.
; PLAN: r0=114(x), r1=129(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 129
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
