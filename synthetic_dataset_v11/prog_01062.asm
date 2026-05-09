; DESCRIPTION: Places a white circle of radius 29 at center (147, 185).
; PLAN: r0=147(x), r1=185(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 185
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
