; DESCRIPTION: Places a purple circle of radius 22 at center (150, 89).
; PLAN: r0=150(x), r1=89(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 89
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
