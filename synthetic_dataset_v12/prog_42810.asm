; DESCRIPTION: Places a blue circle of radius 54 at center (311, 170).
; PLAN: r0=311(x), r1=170(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 170
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
