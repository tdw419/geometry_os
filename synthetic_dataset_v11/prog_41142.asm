; DESCRIPTION: Composite: . Then Creates a red circular shape at (129, 125) with radius 78. Then Places a purple dot at position (132, 17).
; PLAN: r0=129(x), r1=125(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (129, 125) with radius 78.
; PLAN: r0=129(x), r1=125(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 125
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (132, 17).
; PLAN: r0=132(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
