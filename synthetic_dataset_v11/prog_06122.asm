; DESCRIPTION: Composite: . Then Sets a single red pixel at (5, 8). Then Creates a white circular shape at (65, 184) with radius 32.
; PLAN: r0=5(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=184(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (5, 8).
; PLAN: r0=5(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (65, 184) with radius 32.
; PLAN: r0=65(x), r1=184(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 184
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
