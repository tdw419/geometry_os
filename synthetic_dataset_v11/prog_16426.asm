; DESCRIPTION: Composite: . Then Renders a green disk with center (178, 26) and radius 26. Then Sets a single magenta pixel at (62, 106).
; PLAN: r0=178(x), r1=26(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=62(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (178, 26) and radius 26.
; PLAN: r0=178(x), r1=26(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 26
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (62, 106).
; PLAN: r0=62(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
