; DESCRIPTION: Places a yellow circle of radius 78 at center (93, 174).
; PLAN: r0=93(x), r1=174(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 174
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
