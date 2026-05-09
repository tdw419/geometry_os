; DESCRIPTION: Composite: . Then Renders a yellow disk with center (203, 135) and radius 36. Then Sets a single red pixel at (225, 65).
; PLAN: r0=203(x), r1=135(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=225(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (203, 135) and radius 36.
; PLAN: r0=203(x), r1=135(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 135
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (225, 65).
; PLAN: r0=225(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 65
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
