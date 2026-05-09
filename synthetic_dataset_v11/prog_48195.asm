; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (81, 153) with radius 12. Then Places a white dot at position (67, 251).
; PLAN: r0=81(x), r1=153(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (81, 153) with radius 12.
; PLAN: r0=81(x), r1=153(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 153
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (67, 251).
; PLAN: r0=67(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
