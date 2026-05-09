; DESCRIPTION: Composite: Renders a white disk with center (75, 151) and radius 14 then Sets a single yellow pixel at (386, 68).
; PLAN: r0=75(x), r1=151(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 151
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
