; DESCRIPTION: Creates a purple circular shape at (48, 125) with radius 12.
; PLAN: r0=48(x), r1=125(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 125
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
