; DESCRIPTION: Places a orange disk with center (133, 7) and radius 27.
; PLAN: r0=133(x), r1=7(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 7
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
