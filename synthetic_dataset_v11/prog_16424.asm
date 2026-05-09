; DESCRIPTION: Composite: . Then Places a white dot at position (236, 86). Then Places a red circle of radius 17 at center (53, 159).
; PLAN: r0=236(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=159(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (236, 86).
; PLAN: r0=236(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 17 at center (53, 159).
; PLAN: r0=53(x), r1=159(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 159
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
