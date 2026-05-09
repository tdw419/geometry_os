; DESCRIPTION: Composite: . Then Renders a blue disk with center (59, 112) and radius 59. Then Sets a single red pixel at (182, 100).
; PLAN: r0=59(x), r1=112(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (59, 112) and radius 59.
; PLAN: r0=59(x), r1=112(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 112
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (182, 100).
; PLAN: r0=182(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
