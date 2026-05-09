; DESCRIPTION: Places a orange circle of radius 10 at center (45, 137).
; PLAN: r0=45(x), r1=137(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 137
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
