; DESCRIPTION: Composite: . Then Places a yellow circle of radius 75 at center (147, 78). Then Places a white dot at position (106, 178).
; PLAN: r0=147(x), r1=78(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 75 at center (147, 78).
; PLAN: r0=147(x), r1=78(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 78
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (106, 178).
; PLAN: r0=106(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 178
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
