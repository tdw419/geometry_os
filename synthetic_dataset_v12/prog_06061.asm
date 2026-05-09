; DESCRIPTION: Places a orange circle of radius 51 at center (218, 144).
; PLAN: r0=218(x), r1=144(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 144
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
