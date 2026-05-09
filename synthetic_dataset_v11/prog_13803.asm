; DESCRIPTION: Creates a green circular shape at (207, 80) with radius 32.
; PLAN: r0=207(x), r1=80(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 80
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
