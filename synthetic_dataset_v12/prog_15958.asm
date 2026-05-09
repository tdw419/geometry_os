; DESCRIPTION: Creates a yellow circular shape at (480, 200) with radius 26.
; PLAN: r0=480(x), r1=200(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 200
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
