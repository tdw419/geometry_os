; DESCRIPTION: Composite: Renders a cyan disk with center (77, 60) and radius 52 then Sets a single purple pixel at (78, 146).
; PLAN: r0=77(x), r1=60(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=146(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 60
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 146
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
