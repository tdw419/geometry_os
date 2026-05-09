; DESCRIPTION: Places a blue circle of radius 75 at center (433, 133).
; PLAN: r0=433(x), r1=133(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 133
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
