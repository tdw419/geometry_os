; DESCRIPTION: Places a white disk with center (199, 185) and radius 69.
; PLAN: r0=199(x), r1=185(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 185
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
