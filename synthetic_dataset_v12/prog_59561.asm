; DESCRIPTION: Composite: Renders a black disk with center (115, 48) and radius 36 then Places a cyan dot at position (254, 92).
; PLAN: r0=115(x), r1=48(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=92(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 48
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 92
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
