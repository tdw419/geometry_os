; DESCRIPTION: Places a yellow disk with center (27, 74) and radius 61.
; PLAN: r0=27(x), r1=74(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 74
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
