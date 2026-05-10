; DESCRIPTION: Composite: Places a yellow dot at position (129, 70) then Draws a black circle centered at (177, 143) with radius 27.
; PLAN: r0=129(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=143(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 177
LDI r6, 143
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
