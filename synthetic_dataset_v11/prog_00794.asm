; DESCRIPTION: Composite: . Then Sets a single green pixel at (0, 146). Then Renders a black disk with center (154, 75) and radius 73.
; PLAN: r0=0(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=154(x), r1=75(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (0, 146).
; PLAN: r0=0(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (154, 75) and radius 73.
; PLAN: r0=154(x), r1=75(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 75
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
