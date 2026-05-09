; DESCRIPTION: Composite: . Then Renders a yellow disk with center (121, 175) and radius 71. Then Sets a single green pixel at (171, 3).
; PLAN: r0=121(x), r1=175(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (121, 175) and radius 71.
; PLAN: r0=121(x), r1=175(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 175
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (171, 3).
; PLAN: r0=171(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
