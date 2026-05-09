; DESCRIPTION: Composite: . Then Places a red dot at position (80, 160). Then Places a black circle of radius 16 at center (58, 237).
; PLAN: r0=80(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=58(x), r1=237(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (80, 160).
; PLAN: r0=80(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a black circle of radius 16 at center (58, 237).
; PLAN: r0=58(x), r1=237(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 237
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
