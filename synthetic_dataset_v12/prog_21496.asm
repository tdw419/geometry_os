; DESCRIPTION: Creates a white circular shape at (133, 147) with radius 56.
; PLAN: r0=133(x), r1=147(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 147
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
