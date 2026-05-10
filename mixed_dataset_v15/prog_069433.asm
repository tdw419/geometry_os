; DESCRIPTION: Places a black circle of radius 80 at center (225, 106).
; PLAN: r0=225(x), r1=106(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 106
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
