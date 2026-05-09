; DESCRIPTION: Creates a white circular shape at (185, 97) with radius 40.
; PLAN: r0=185(x), r1=97(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 97
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
