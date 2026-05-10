; DESCRIPTION: Places a yellow disk with center (379, 107) and radius 22.
; PLAN: r0=379(x), r1=107(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 107
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
