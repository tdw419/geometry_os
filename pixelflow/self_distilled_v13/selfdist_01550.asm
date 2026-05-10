; DESCRIPTION: Places a blue disk with center (286, 38) and radius 53.
; PLAN: r0=286(x), r1=38(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 38
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
