; DESCRIPTION: Composite: . Then Creates a purple circular shape at (73, 228) with radius 25. Then Places a magenta dot at position (11, 100).
; PLAN: r0=73(x), r1=228(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=11(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (73, 228) with radius 25.
; PLAN: r0=73(x), r1=228(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 228
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (11, 100).
; PLAN: r0=11(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 100
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
