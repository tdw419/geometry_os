; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (178, 117). Then Renders a yellow disk with center (87, 122) and radius 63.
; PLAN: r0=178(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=122(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (178, 117).
; PLAN: r0=178(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (87, 122) and radius 63.
; PLAN: r0=87(x), r1=122(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 122
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
