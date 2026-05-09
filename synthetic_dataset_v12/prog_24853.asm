; DESCRIPTION: Places a black circle of radius 61 at center (303, 84).
; PLAN: r0=303(x), r1=84(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 84
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
