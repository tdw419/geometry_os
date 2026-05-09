; DESCRIPTION: Places a red circle of radius 44 at center (321, 98).
; PLAN: r0=321(x), r1=98(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 98
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
