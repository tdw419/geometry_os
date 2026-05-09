; DESCRIPTION: Composite: Places a blue dot at position (421, 205) then Creates a white circular shape at (400, 163) with radius 74.
; PLAN: r0=421(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=163(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 163
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
