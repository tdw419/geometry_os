; DESCRIPTION: Creates a black circular shape at (480, 110) with radius 17.
; PLAN: r0=480(x), r1=110(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 110
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
