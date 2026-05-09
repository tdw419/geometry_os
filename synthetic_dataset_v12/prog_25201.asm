; DESCRIPTION: Places a yellow circle of radius 58 at center (343, 174).
; PLAN: r0=343(x), r1=174(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 174
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
