; DESCRIPTION: Places a blue circle of radius 25 at center (257, 55).
; PLAN: r0=257(x), r1=55(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 55
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
