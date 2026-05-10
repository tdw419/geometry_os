; DESCRIPTION: Places a orange circle of radius 55 at center (391, 93).
; PLAN: r0=391(x), r1=93(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 93
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
