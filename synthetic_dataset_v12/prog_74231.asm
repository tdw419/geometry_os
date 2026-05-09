; DESCRIPTION: Creates a green circular shape at (433, 120) with radius 33.
; PLAN: r0=433(x), r1=120(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 120
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
