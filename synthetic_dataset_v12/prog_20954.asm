; DESCRIPTION: Creates a green circular shape at (403, 211) with radius 10.
; PLAN: r0=403(x), r1=211(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 211
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
