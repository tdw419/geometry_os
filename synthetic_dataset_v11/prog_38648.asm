; DESCRIPTION: Creates a purple circular shape at (131, 151) with radius 27.
; PLAN: r0=131(x), r1=151(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 151
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
