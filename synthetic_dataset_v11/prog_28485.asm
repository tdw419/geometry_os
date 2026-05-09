; DESCRIPTION: Composite: . Then Places a purple circle of radius 26 at center (32, 160). Then Places a white dot at position (53, 49).
; PLAN: r0=32(x), r1=160(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 26 at center (32, 160).
; PLAN: r0=32(x), r1=160(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 160
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (53, 49).
; PLAN: r0=53(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
