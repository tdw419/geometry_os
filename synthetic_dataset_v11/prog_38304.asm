; DESCRIPTION: Composite: . Then Places a red dot at position (183, 165). Then Creates a purple circular shape at (97, 239) with radius 12.
; PLAN: r0=183(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=97(x), r1=239(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (183, 165).
; PLAN: r0=183(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (97, 239) with radius 12.
; PLAN: r0=97(x), r1=239(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 239
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
