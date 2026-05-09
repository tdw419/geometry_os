; DESCRIPTION: Places a black circle of radius 38 at center (290, 122).
; PLAN: r0=290(x), r1=122(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 122
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
