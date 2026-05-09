; DESCRIPTION: Composite: . Then Places a red circle of radius 12 at center (49, 208). Then Sets a single black pixel at (67, 133).
; PLAN: r0=49(x), r1=208(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 12 at center (49, 208).
; PLAN: r0=49(x), r1=208(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 208
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (67, 133).
; PLAN: r0=67(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
HALT
