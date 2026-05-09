; DESCRIPTION: Composite: . Then Places a purple circle of radius 67 at center (182, 188). Then Sets a single blue pixel at (82, 144).
; PLAN: r0=182(x), r1=188(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 67 at center (182, 188).
; PLAN: r0=182(x), r1=188(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 188
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (82, 144).
; PLAN: r0=82(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
