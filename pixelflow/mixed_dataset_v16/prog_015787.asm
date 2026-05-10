; DESCRIPTION: Places a white disk with center (2, 152) and radius 61.
; PLAN: r0=2(x), r1=152(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 2
LDI r1, 152
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
