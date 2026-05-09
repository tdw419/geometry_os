; DESCRIPTION: Places a yellow circle of radius 61 at center (365, 71).
; PLAN: r0=365(x), r1=71(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 71
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
