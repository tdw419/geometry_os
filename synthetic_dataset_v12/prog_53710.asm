; DESCRIPTION: Creates a purple circular shape at (439, 175) with radius 57.
; PLAN: r0=439(x), r1=175(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 175
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
