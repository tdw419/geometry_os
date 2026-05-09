; DESCRIPTION: Composite: . Then Creates a red circular shape at (100, 115) with radius 63. Then Places a white dot at position (112, 196).
; PLAN: r0=100(x), r1=115(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (100, 115) with radius 63.
; PLAN: r0=100(x), r1=115(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 115
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (112, 196).
; PLAN: r0=112(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
