; DESCRIPTION: Places a blue circle of radius 55 at center (271, 162).
; PLAN: r0=271(x), r1=162(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 162
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
