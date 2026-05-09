; DESCRIPTION: Creates a green circular shape at (195, 103) with radius 59.
; PLAN: r0=195(x), r1=103(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 103
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
