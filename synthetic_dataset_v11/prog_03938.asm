; DESCRIPTION: Places a black circle of radius 46 at center (132, 59).
; PLAN: r0=132(x), r1=59(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 59
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
