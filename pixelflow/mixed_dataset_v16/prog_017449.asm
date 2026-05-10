; DESCRIPTION: Composite: Sets a single black pixel at (205, 150) then Renders a black disk with center (295, 51) and radius 42.
; PLAN: r0=205(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=51(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 51
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
