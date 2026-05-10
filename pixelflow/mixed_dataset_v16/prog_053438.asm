; DESCRIPTION: Places a red disk with center (323, 10) and radius 69.
; PLAN: r0=323(x), r1=10(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 10
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
