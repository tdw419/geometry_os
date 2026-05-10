; DESCRIPTION: Places a white disk with center (347, 99) and radius 73.
; PLAN: r0=347(x), r1=99(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 99
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
