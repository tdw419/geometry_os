; DESCRIPTION: Places a green circle of radius 54 at center (441, 96).
; PLAN: r0=441(x), r1=96(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 96
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
