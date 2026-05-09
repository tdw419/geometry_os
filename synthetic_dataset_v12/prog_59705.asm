; DESCRIPTION: Composite: Sets a single green pixel at (166, 219) then Places a green circle of radius 50 at center (245, 163).
; PLAN: r0=166(x), r1=219(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=163(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 219
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 245
LDI r6, 163
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
