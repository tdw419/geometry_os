; DESCRIPTION: Composite: . Then Places a black circle of radius 13 at center (111, 194). Then Places a red dot at position (152, 53).
; PLAN: r0=111(x), r1=194(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=152(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 13 at center (111, 194).
; PLAN: r0=111(x), r1=194(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 194
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (152, 53).
; PLAN: r0=152(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
