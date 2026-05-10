; DESCRIPTION: Places a yellow circle of radius 44 at center (435, 164).
; PLAN: r0=435(x), r1=164(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 164
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
