; DESCRIPTION: Creates a purple circular shape at (316, 109) with radius 10.
; PLAN: r0=316(x), r1=109(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 109
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
