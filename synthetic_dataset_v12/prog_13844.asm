; DESCRIPTION: Places a cyan circle of radius 13 at center (147, 112).
; PLAN: r0=147(x), r1=112(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 112
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
