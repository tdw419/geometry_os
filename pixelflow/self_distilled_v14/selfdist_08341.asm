; DESCRIPTION: Places a blue disk with center (393, 85) and radius 75.
; PLAN: r0=393(x), r1=85(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 85
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
