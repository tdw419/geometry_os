; DESCRIPTION: Composite: . Then Places a green dot at position (161, 114). Then Creates a purple circular shape at (129, 115) with radius 49.
; PLAN: r0=161(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=115(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (161, 114).
; PLAN: r0=161(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (129, 115) with radius 49.
; PLAN: r0=129(x), r1=115(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 115
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
