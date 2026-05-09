; DESCRIPTION: Composite: . Then Places a black dot at position (47, 173). Then Places a red circle of radius 24 at center (30, 108).
; PLAN: r0=47(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=30(x), r1=108(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (47, 173).
; PLAN: r0=47(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 24 at center (30, 108).
; PLAN: r0=30(x), r1=108(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 108
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
