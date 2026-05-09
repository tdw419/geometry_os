; DESCRIPTION: Places a black circle of radius 69 at center (338, 187).
; PLAN: r0=338(x), r1=187(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 187
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
