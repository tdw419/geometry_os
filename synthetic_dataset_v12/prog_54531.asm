; DESCRIPTION: Places a green circle of radius 69 at center (430, 90).
; PLAN: r0=430(x), r1=90(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 90
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
