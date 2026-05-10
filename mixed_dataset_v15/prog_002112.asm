; DESCRIPTION: Composite: Renders a black disk with center (450, 162) and radius 55 then Places a green dot at position (477, 78).
; PLAN: r0=450(x), r1=162(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 162
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
