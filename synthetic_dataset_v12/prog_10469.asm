; DESCRIPTION: Composite: Sets a single yellow pixel at (266, 204) then Renders a red disk with center (185, 135) and radius 48.
; PLAN: r0=266(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=135(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 135
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
