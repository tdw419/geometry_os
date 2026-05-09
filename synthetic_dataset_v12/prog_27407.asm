; DESCRIPTION: Places a white circle of radius 44 at center (147, 105).
; PLAN: r0=147(x), r1=105(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 105
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
