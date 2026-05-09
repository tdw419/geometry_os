; DESCRIPTION: Creates a yellow circular shape at (178, 199) with radius 22.
; PLAN: r0=178(x), r1=199(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 199
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
