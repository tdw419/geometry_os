; DESCRIPTION: Places a orange circle of radius 61 at center (394, 143).
; PLAN: r0=394(x), r1=143(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 143
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
