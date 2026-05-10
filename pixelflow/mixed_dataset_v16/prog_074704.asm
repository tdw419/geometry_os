; DESCRIPTION: Places a orange circle of radius 26 at center (448, 182).
; PLAN: r0=448(x), r1=182(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 182
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
