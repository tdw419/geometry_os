; DESCRIPTION: Places a purple circle of radius 68 at center (257, 160).
; PLAN: r0=257(x), r1=160(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 160
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
