; DESCRIPTION: Places a green circle of radius 24 at center (132, 31).
; PLAN: r0=132(x), r1=31(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 31
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
