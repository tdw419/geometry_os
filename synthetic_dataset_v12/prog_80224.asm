; DESCRIPTION: Places a orange circle of radius 39 at center (180, 131).
; PLAN: r0=180(x), r1=131(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 131
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
