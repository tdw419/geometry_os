; DESCRIPTION: Places a red disk with center (78, 86) and radius 61.
; PLAN: r0=78(x), r1=86(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 86
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
