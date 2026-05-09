; DESCRIPTION: Composite: Renders a cyan disk with center (93, 102) and radius 74 then Places a green dot at position (389, 237).
; PLAN: r0=93(x), r1=102(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=237(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 102
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 237
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
