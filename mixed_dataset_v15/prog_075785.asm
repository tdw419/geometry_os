; DESCRIPTION: Creates a green circular shape at (120, 177) with radius 23.
; PLAN: r0=120(x), r1=177(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 177
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
