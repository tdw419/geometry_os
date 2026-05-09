; DESCRIPTION: Creates a green circular shape at (277, 110) with radius 36.
; PLAN: r0=277(x), r1=110(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 110
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
