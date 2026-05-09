; DESCRIPTION: Composite: Sets a single black pixel at (47, 186) then Draws a yellow circle centered at (247, 143) with radius 54.
; PLAN: r0=47(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=143(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 247
LDI r6, 143
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
