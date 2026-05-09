; DESCRIPTION: Composite: . Then Places a purple dot at position (29, 197). Then Creates a black circular shape at (157, 179) with radius 39.
; PLAN: r0=29(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=179(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (29, 197).
; PLAN: r0=29(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (157, 179) with radius 39.
; PLAN: r0=157(x), r1=179(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 179
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
