; DESCRIPTION: Creates a green circular shape at (110, 120) with radius 76.
; PLAN: r0=110(x), r1=120(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 120
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
