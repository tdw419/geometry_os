; DESCRIPTION: Creates a yellow circular shape at (293, 207) with radius 45.
; PLAN: r0=293(x), r1=207(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 207
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
