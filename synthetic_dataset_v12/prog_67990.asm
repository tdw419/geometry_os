; DESCRIPTION: Places a blue circle of radius 38 at center (162, 138).
; PLAN: r0=162(x), r1=138(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 138
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
