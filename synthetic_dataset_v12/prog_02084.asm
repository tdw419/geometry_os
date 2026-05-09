; DESCRIPTION: Places a purple circle of radius 32 at center (65, 50).
; PLAN: r0=65(x), r1=50(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 50
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
