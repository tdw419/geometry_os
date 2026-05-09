; DESCRIPTION: Places a orange circle of radius 36 at center (166, 89).
; PLAN: r0=166(x), r1=89(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 89
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
