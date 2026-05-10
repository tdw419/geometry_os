; DESCRIPTION: Places a yellow disk with center (72, 61) and radius 43.
; PLAN: r0=72(x), r1=61(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 61
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
