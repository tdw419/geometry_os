; DESCRIPTION: Places a black circle of radius 56 at center (222, 142).
; PLAN: r0=222(x), r1=142(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 142
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
