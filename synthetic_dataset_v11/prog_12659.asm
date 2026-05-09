; DESCRIPTION: Places a orange circle of radius 64 at center (140, 131).
; PLAN: r0=140(x), r1=131(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 131
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
