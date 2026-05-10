; DESCRIPTION: Places a red disk with center (301, 75) and radius 80.
; PLAN: r0=301(x), r1=75(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 75
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
