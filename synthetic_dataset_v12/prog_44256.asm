; DESCRIPTION: Creates a purple circular shape at (383, 87) with radius 27.
; PLAN: r0=383(x), r1=87(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 87
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
