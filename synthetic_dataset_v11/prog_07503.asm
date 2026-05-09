; DESCRIPTION: Places a red circle of radius 40 at center (188, 147).
; PLAN: r0=188(x), r1=147(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 147
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
