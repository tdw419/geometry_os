; DESCRIPTION: Places a white disk with center (245, 75) and radius 58.
; PLAN: r0=245(x), r1=75(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 75
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
