; DESCRIPTION: Composite: . Then Places a orange dot at position (129, 132). Then Creates a red circular shape at (179, 153) with radius 75.
; PLAN: r0=129(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=179(x), r1=153(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (129, 132).
; PLAN: r0=129(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (179, 153) with radius 75.
; PLAN: r0=179(x), r1=153(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 153
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
