; DESCRIPTION: Composite: . Then Sets a single white pixel at (73, 237). Then Renders a magenta disk with center (176, 156) and radius 76.
; PLAN: r0=73(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=176(x), r1=156(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (73, 237).
; PLAN: r0=73(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (176, 156) and radius 76.
; PLAN: r0=176(x), r1=156(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 156
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
