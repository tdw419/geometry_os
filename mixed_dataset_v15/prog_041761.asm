; DESCRIPTION: Places a yellow circle of radius 77 at center (388, 169).
; PLAN: r0=388(x), r1=169(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 169
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
