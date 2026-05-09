; DESCRIPTION: Composite: . Then Renders a blue disk with center (209, 25) and radius 12. Then Sets a single magenta pixel at (175, 3).
; PLAN: r0=209(x), r1=25(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x), r1=3(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (209, 25) and radius 12.
; PLAN: r0=209(x), r1=25(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 25
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (175, 3).
; PLAN: r0=175(x), r1=3(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 3
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
