; DESCRIPTION: Composite: . Then Places a purple circle of radius 55 at center (164, 164). Then Places a black dot at position (178, 152).
; PLAN: r0=164(x), r1=164(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 55 at center (164, 164).
; PLAN: r0=164(x), r1=164(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 164
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (178, 152).
; PLAN: r0=178(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
HALT
