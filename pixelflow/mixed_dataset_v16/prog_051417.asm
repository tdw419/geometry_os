; DESCRIPTION: Places a yellow disk with center (229, 182) and radius 11.
; PLAN: r0=229(x), r1=182(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 182
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
