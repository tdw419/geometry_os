; DESCRIPTION: Composite: Renders a cyan disk with center (292, 158) and radius 55 then Sets a single green pixel at (499, 73).
; PLAN: r0=292(x), r1=158(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=73(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 158
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 73
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
