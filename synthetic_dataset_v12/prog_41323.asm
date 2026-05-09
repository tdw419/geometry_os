; DESCRIPTION: Places a yellow circle of radius 49 at center (254, 165).
; PLAN: r0=254(x), r1=165(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 165
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
