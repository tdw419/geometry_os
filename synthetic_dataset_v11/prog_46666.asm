; DESCRIPTION: Places a blue circle of radius 25 at center (26, 82).
; PLAN: r0=26(x), r1=82(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 82
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
