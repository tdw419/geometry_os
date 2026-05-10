; DESCRIPTION: Places a black circle of radius 77 at center (188, 80).
; PLAN: r0=188(x), r1=80(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 80
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
