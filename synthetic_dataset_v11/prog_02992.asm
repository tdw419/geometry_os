; DESCRIPTION: Places a black circle of radius 65 at center (108, 72).
; PLAN: r0=108(x), r1=72(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 72
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
