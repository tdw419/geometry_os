; DESCRIPTION: Creates a yellow circular shape at (262, 110) with radius 48.
; PLAN: r0=262(x), r1=110(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 110
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
