; DESCRIPTION: Places a blue circle of radius 38 at center (223, 180).
; PLAN: r0=223(x), r1=180(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 180
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
