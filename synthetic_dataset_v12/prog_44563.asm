; DESCRIPTION: Creates a yellow circular shape at (87, 69) with radius 51.
; PLAN: r0=87(x), r1=69(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 69
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
