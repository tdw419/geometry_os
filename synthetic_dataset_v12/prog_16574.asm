; DESCRIPTION: Places a yellow circle of radius 19 at center (386, 85).
; PLAN: r0=386(x), r1=85(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 85
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
