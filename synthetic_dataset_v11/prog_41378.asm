; DESCRIPTION: Creates a purple circular shape at (168, 54) with radius 54.
; PLAN: r0=168(x), r1=54(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 54
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
