; DESCRIPTION: Composite: . Then Sets a single black pixel at (57, 122). Then Creates a magenta circular shape at (143, 95) with radius 16.
; PLAN: r0=57(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=143(x), r1=95(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (57, 122).
; PLAN: r0=57(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (143, 95) with radius 16.
; PLAN: r0=143(x), r1=95(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 95
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
