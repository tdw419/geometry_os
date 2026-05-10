; DESCRIPTION: Places a orange circle of radius 74 at center (302, 131).
; PLAN: r0=302(x), r1=131(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 131
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
