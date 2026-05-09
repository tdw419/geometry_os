; DESCRIPTION: Places a green circle of radius 62 at center (103, 79).
; PLAN: r0=103(x), r1=79(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 79
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
