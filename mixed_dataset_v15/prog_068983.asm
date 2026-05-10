; DESCRIPTION: Places a yellow disk with center (59, 93) and radius 19.
; PLAN: r0=59(x), r1=93(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 93
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
