; DESCRIPTION: Places a blue circle of radius 38 at center (389, 143).
; PLAN: r0=389(x), r1=143(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 143
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
