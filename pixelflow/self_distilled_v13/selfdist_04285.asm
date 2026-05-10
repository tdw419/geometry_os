; DESCRIPTION: Places a white disk with center (56, 81) and radius 27.
; PLAN: r0=56(x), r1=81(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 81
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
