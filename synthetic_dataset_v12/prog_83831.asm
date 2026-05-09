; DESCRIPTION: Places a orange circle of radius 30 at center (467, 121).
; PLAN: r0=467(x), r1=121(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 121
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
