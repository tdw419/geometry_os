; DESCRIPTION: Places a yellow disk with center (233, 116) and radius 47.
; PLAN: r0=233(x), r1=116(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 116
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
