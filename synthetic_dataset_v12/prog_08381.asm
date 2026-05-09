; DESCRIPTION: Places a blue circle of radius 14 at center (79, 162).
; PLAN: r0=79(x), r1=162(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 162
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
