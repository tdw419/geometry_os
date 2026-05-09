; DESCRIPTION: Places a blue circle of radius 36 at center (464, 149).
; PLAN: r0=464(x), r1=149(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 149
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
