; DESCRIPTION: Creates a yellow circular shape at (420, 115) with radius 75.
; PLAN: r0=420(x), r1=115(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 115
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
