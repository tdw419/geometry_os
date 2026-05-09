; DESCRIPTION: Composite: . Then Sets a single green pixel at (186, 123). Then Renders a magenta disk with center (93, 135) and radius 76.
; PLAN: r0=186(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=135(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (186, 123).
; PLAN: r0=186(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 123
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (93, 135) and radius 76.
; PLAN: r0=93(x), r1=135(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 135
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
