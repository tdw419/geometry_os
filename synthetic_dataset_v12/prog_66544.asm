; DESCRIPTION: Composite: Renders a blue disk with center (266, 68) and radius 15 then Sets a single cyan pixel at (154, 204).
; PLAN: r0=266(x), r1=68(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=204(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 68
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 204
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
