; DESCRIPTION: Places a white disk with center (199, 70) and radius 22.
; PLAN: r0=199(x), r1=70(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 70
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
