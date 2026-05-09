; DESCRIPTION: Places a blue circle of radius 47 at center (145, 162).
; PLAN: r0=145(x), r1=162(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 162
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
