; DESCRIPTION: Composite: . Then Sets a single green pixel at (26, 182). Then Draws a blue circle centered at (153, 141) with radius 64.
; PLAN: r0=26(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=141(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (26, 182).
; PLAN: r0=26(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (153, 141) with radius 64.
; PLAN: r0=153(x), r1=141(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 141
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
