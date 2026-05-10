; DESCRIPTION: Places a purple circle of radius 73 at center (242, 93).
; PLAN: r0=242(x), r1=93(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 93
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
