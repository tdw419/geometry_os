; DESCRIPTION: Composite: . Then Renders a blue disk with center (50, 62) and radius 35. Then Sets a single black pixel at (174, 160).
; PLAN: r0=50(x), r1=62(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (50, 62) and radius 35.
; PLAN: r0=50(x), r1=62(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 62
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (174, 160).
; PLAN: r0=174(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
HALT
