; DESCRIPTION: Places a blue circle of radius 20 at center (45, 139).
; PLAN: r0=45(x), r1=139(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 139
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
