; DESCRIPTION: Renders a purple disk with center (311, 68) and radius 10.
; PLAN: r0=311(x), r1=68(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 68
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
