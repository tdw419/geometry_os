; DESCRIPTION: Renders a black disk with center (437, 123) and radius 68.
; PLAN: r0=437(x), r1=123(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 123
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
