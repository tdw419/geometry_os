; DESCRIPTION: Places a white disk with center (22, 44) and radius 22.
; PLAN: r0=22(x), r1=44(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 44
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
