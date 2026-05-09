; DESCRIPTION: Composite: . Then Sets a single red pixel at (88, 196). Then Places a magenta circle of radius 17 at center (120, 175).
; PLAN: r0=88(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=120(x), r1=175(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (88, 196).
; PLAN: r0=88(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 17 at center (120, 175).
; PLAN: r0=120(x), r1=175(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 175
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
