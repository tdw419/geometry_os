; DESCRIPTION: Composite: . Then Places a purple dot at position (44, 170). Then Creates a white circular shape at (65, 155) with radius 38.
; PLAN: r0=44(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=155(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (44, 170).
; PLAN: r0=44(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (65, 155) with radius 38.
; PLAN: r0=65(x), r1=155(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 155
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
