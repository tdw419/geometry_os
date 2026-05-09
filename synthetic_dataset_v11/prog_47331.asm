; DESCRIPTION: Composite: . Then Sets a single white pixel at (53, 108). Then Renders a red disk with center (71, 212) and radius 12.
; PLAN: r0=53(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=71(x), r1=212(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (53, 108).
; PLAN: r0=53(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (71, 212) and radius 12.
; PLAN: r0=71(x), r1=212(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 212
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
