; DESCRIPTION: Places a black circle of radius 70 at center (147, 185).
; PLAN: r0=147(x), r1=185(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 185
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
