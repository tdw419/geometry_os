; DESCRIPTION: Places a orange circle of radius 57 at center (226, 124).
; PLAN: r0=226(x), r1=124(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 124
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
