; DESCRIPTION: Composite: . Then Sets a single green pixel at (179, 181). Then Renders a magenta disk with center (166, 148) and radius 60.
; PLAN: r0=179(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=148(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (179, 181).
; PLAN: r0=179(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (166, 148) and radius 60.
; PLAN: r0=166(x), r1=148(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 148
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
