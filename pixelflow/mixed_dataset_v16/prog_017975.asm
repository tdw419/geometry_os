; DESCRIPTION: Places a green circle of radius 16 at center (254, 175).
; PLAN: r0=254(x), r1=175(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 175
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
