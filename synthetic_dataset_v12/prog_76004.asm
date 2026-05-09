; DESCRIPTION: Composite: Sets a single orange pixel at (121, 97) then Places a yellow circle of radius 43 at center (285, 46).
; PLAN: r0=121(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=46(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 285
LDI r6, 46
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
