; DESCRIPTION: Places a red circle of radius 18 at center (439, 71).
; PLAN: r0=439(x), r1=71(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 71
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
