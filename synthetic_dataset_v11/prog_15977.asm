; DESCRIPTION: Composite: . Then Renders a blue disk with center (82, 184) and radius 27. Then Sets a single blue pixel at (81, 255).
; PLAN: r0=82(x), r1=184(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=81(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (82, 184) and radius 27.
; PLAN: r0=82(x), r1=184(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 184
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (81, 255).
; PLAN: r0=81(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 255
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
