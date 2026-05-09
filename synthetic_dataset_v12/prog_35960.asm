; DESCRIPTION: Places a yellow circle of radius 33 at center (441, 143).
; PLAN: r0=441(x), r1=143(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 143
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
