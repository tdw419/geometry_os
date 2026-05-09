; DESCRIPTION: Creates a purple circular shape at (240, 194) with radius 10.
; PLAN: r0=240(x), r1=194(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 194
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
