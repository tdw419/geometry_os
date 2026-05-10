; DESCRIPTION: Places a blue disk with center (355, 131) and radius 36.
; PLAN: r0=355(x), r1=131(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 131
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
