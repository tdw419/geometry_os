; DESCRIPTION: Places a red disk with center (5, 189) and radius 80.
; PLAN: r0=5(x), r1=189(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 5
LDI r1, 189
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
