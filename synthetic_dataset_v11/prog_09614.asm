; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (253, 34). Then Renders a white disk with center (182, 111) and radius 68.
; PLAN: r0=253(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=182(x), r1=111(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (253, 34).
; PLAN: r0=253(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (182, 111) and radius 68.
; PLAN: r0=182(x), r1=111(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 111
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
