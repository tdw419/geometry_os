; DESCRIPTION: Places a white circle of radius 47 at center (147, 204).
; PLAN: r0=147(x), r1=204(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 204
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
