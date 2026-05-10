; DESCRIPTION: Places a green circle of radius 61 at center (70, 147).
; PLAN: r0=70(x), r1=147(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 147
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
