; DESCRIPTION: Places a black circle of radius 20 at center (323, 106).
; PLAN: r0=323(x), r1=106(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 106
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
