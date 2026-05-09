; DESCRIPTION: Places a orange circle of radius 51 at center (285, 188).
; PLAN: r0=285(x), r1=188(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 188
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
