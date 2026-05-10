; DESCRIPTION: Places a red disk with center (147, 161) and radius 33.
; PLAN: r0=147(x), r1=161(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 161
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
