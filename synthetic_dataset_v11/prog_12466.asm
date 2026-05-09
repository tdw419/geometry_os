; DESCRIPTION: Creates a purple circular shape at (165, 175) with radius 63.
; PLAN: r0=165(x), r1=175(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 175
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
