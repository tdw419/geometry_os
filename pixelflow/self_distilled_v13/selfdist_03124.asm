; DESCRIPTION: Places a blue disk with center (311, 133) and radius 38.
; PLAN: r0=311(x), r1=133(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 133
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
