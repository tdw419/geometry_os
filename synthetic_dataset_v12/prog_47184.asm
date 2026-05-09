; DESCRIPTION: Places a black circle of radius 36 at center (169, 212).
; PLAN: r0=169(x), r1=212(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 212
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
