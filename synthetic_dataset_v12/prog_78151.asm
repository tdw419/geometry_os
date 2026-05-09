; DESCRIPTION: Places a orange circle of radius 32 at center (311, 181).
; PLAN: r0=311(x), r1=181(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 181
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
