; DESCRIPTION: Places a orange circle of radius 39 at center (188, 149).
; PLAN: r0=188(x), r1=149(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 149
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
