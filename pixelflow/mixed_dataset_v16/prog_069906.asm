; DESCRIPTION: Places a white circle of radius 57 at center (247, 147).
; PLAN: r0=247(x), r1=147(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 147
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
