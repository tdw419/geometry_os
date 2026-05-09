; DESCRIPTION: Composite: Renders a blue disk with center (327, 172) and radius 78 then Sets a single cyan pixel at (330, 89).
; PLAN: r0=327(x), r1=172(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 172
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
