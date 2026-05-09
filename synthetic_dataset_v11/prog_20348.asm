; DESCRIPTION: Composite: . Then Places a purple dot at position (25, 115). Then Creates a white circular shape at (88, 140) with radius 49.
; PLAN: r0=25(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=88(x), r1=140(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (25, 115).
; PLAN: r0=25(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (88, 140) with radius 49.
; PLAN: r0=88(x), r1=140(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 140
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
