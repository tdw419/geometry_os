; DESCRIPTION: Places a blue circle of radius 51 at center (205, 162).
; PLAN: r0=205(x), r1=162(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 162
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
