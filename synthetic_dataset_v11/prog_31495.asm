; DESCRIPTION: Composite: . Then Renders a blue disk with center (67, 129) and radius 20. Then Sets a single orange pixel at (201, 163).
; PLAN: r0=67(x), r1=129(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=201(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (67, 129) and radius 20.
; PLAN: r0=67(x), r1=129(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 129
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (201, 163).
; PLAN: r0=201(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 163
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
