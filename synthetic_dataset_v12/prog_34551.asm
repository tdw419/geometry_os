; DESCRIPTION: Composite: Sets a single yellow pixel at (425, 205) then Renders a yellow disk with center (60, 94) and radius 33.
; PLAN: r0=425(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=94(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 205
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 94
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
