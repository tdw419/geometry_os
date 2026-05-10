; DESCRIPTION: Places a orange disk with center (35, 80) and radius 55.
; PLAN: r0=35(x), r1=80(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 80
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
