; DESCRIPTION: Composite: . Then Places a black circle of radius 63 at center (117, 156). Then Places a black dot at position (38, 1).
; PLAN: r0=117(x), r1=156(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=38(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 63 at center (117, 156).
; PLAN: r0=117(x), r1=156(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 156
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (38, 1).
; PLAN: r0=38(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
HALT
