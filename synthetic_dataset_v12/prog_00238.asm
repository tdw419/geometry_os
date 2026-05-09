; DESCRIPTION: Creates a purple circular shape at (229, 218) with radius 27.
; PLAN: r0=229(x), r1=218(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 218
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
