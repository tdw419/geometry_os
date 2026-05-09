; DESCRIPTION: Places a black circle of radius 69 at center (95, 160).
; PLAN: r0=95(x), r1=160(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 160
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
