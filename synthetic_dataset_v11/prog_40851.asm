; DESCRIPTION: Composite: . Then Places a red dot at position (3, 63). Then Creates a yellow circular shape at (167, 98) with radius 76.
; PLAN: r0=3(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=167(x), r1=98(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (3, 63).
; PLAN: r0=3(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (167, 98) with radius 76.
; PLAN: r0=167(x), r1=98(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 98
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
