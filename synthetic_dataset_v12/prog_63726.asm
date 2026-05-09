; DESCRIPTION: Places a orange circle of radius 10 at center (318, 236).
; PLAN: r0=318(x), r1=236(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 236
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
