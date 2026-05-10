; DESCRIPTION: Composite: Renders a cyan disk with center (369, 160) and radius 47 then Sets a single black pixel at (462, 13).
; PLAN: r0=369(x), r1=160(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=13(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 160
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 13
LDI r7, 0x000000
PSET r5, r6, r7
HALT
