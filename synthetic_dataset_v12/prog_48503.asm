; DESCRIPTION: Composite: Renders a cyan disk with center (180, 101) and radius 79 then Sets a single black pixel at (158, 164).
; PLAN: r0=180(x), r1=101(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=164(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 101
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 164
LDI r7, 0x000000
PSET r5, r6, r7
HALT
