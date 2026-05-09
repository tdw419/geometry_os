; DESCRIPTION: Composite: . Then Sets a single green pixel at (253, 10). Then Renders a red disk with center (176, 81) and radius 29.
; PLAN: r0=253(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=176(x), r1=81(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (253, 10).
; PLAN: r0=253(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (176, 81) and radius 29.
; PLAN: r0=176(x), r1=81(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 81
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
