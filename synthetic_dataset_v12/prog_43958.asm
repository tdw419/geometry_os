; DESCRIPTION: Places a orange circle of radius 20 at center (193, 208).
; PLAN: r0=193(x), r1=208(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 208
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
