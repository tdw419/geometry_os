; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (156, 100) with radius 35. Then Places a white dot at position (24, 20).
; PLAN: r0=156(x), r1=100(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=24(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (156, 100) with radius 35.
; PLAN: r0=156(x), r1=100(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 100
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (24, 20).
; PLAN: r0=24(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
