; DESCRIPTION: Places a yellow disk with center (193, 116) and radius 34.
; PLAN: r0=193(x), r1=116(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 116
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
