; DESCRIPTION: Composite: . Then Sets a single green pixel at (175, 75). Then Creates a green circular shape at (191, 159) with radius 47.
; PLAN: r0=175(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=191(x), r1=159(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (175, 75).
; PLAN: r0=175(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (191, 159) with radius 47.
; PLAN: r0=191(x), r1=159(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 159
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
