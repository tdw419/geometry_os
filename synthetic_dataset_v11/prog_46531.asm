; DESCRIPTION: Places a purple circle of radius 54 at center (168, 64).
; PLAN: r0=168(x), r1=64(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 64
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
