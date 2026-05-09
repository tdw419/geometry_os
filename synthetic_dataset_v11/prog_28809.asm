; DESCRIPTION: Composite: . Then Renders a red disk with center (137, 111) and radius 71. Then Sets a single orange pixel at (255, 32).
; PLAN: r0=137(x), r1=111(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=255(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (137, 111) and radius 71.
; PLAN: r0=137(x), r1=111(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 111
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (255, 32).
; PLAN: r0=255(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
