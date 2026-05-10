; DESCRIPTION: Places a red disk with center (394, 123) and radius 38.
; PLAN: r0=394(x), r1=123(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 123
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
