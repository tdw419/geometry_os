; DESCRIPTION: Places a orange circle of radius 80 at center (337, 144).
; PLAN: r0=337(x), r1=144(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 144
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
