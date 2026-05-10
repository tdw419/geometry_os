; DESCRIPTION: Places a orange circle of radius 38 at center (221, 39).
; PLAN: r0=221(x), r1=39(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 39
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
