; DESCRIPTION: Places a yellow disk with center (151, 111) and radius 61.
; PLAN: r0=151(x), r1=111(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 111
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
