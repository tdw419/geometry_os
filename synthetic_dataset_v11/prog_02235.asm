; DESCRIPTION: Creates a white circular shape at (185, 230) with radius 17.
; PLAN: r0=185(x), r1=230(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 230
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
