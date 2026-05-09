; DESCRIPTION: Creates a green circular shape at (103, 77) with radius 11.
; PLAN: r0=103(x), r1=77(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 77
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
