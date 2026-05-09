; DESCRIPTION: Creates a white circular shape at (254, 145) with radius 75.
; PLAN: r0=254(x), r1=145(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 145
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
