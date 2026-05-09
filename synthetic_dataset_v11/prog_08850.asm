; DESCRIPTION: Places a blue circle of radius 47 at center (105, 75).
; PLAN: r0=105(x), r1=75(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 75
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
