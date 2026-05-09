; DESCRIPTION: Places a orange circle of radius 14 at center (178, 214).
; PLAN: r0=178(x), r1=214(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 214
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
