; DESCRIPTION: Places a orange circle of radius 45 at center (236, 208).
; PLAN: r0=236(x), r1=208(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 208
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
