; DESCRIPTION: Places a blue circle of radius 12 at center (199, 100).
; PLAN: r0=199(x), r1=100(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 100
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
