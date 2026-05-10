; DESCRIPTION: Places a red disk with center (9, 147) and radius 34.
; PLAN: r0=9(x), r1=147(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 9
LDI r1, 147
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
