; DESCRIPTION: Places a green circle of radius 70 at center (148, 175).
; PLAN: r0=148(x), r1=175(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 175
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
