; DESCRIPTION: Places a yellow disk with center (176, 199) and radius 36.
; PLAN: r0=176(x), r1=199(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 199
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
