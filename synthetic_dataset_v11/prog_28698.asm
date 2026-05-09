; DESCRIPTION: Creates a green circular shape at (185, 96) with radius 17.
; PLAN: r0=185(x), r1=96(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 96
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
