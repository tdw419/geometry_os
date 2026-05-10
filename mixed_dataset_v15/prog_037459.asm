; DESCRIPTION: Places a orange circle of radius 43 at center (394, 64).
; PLAN: r0=394(x), r1=64(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 64
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
