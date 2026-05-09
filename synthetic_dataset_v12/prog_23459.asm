; DESCRIPTION: Creates a green circular shape at (433, 75) with radius 48.
; PLAN: r0=433(x), r1=75(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 75
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
