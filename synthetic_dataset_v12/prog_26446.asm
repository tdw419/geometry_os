; DESCRIPTION: Places a blue circle of radius 53 at center (439, 199).
; PLAN: r0=439(x), r1=199(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 199
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
