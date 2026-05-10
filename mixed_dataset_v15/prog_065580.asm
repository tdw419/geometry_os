; DESCRIPTION: Places a red disk with center (318, 87) and radius 23.
; PLAN: r0=318(x), r1=87(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 87
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
