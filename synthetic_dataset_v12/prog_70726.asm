; DESCRIPTION: Composite: Sets a single red pixel at (321, 210) then Places a yellow circle of radius 42 at center (389, 161).
; PLAN: r0=321(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=161(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 161
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
