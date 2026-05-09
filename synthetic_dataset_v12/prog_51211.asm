; DESCRIPTION: Composite: Places a black dot at position (305, 241) then Renders a red disk with center (309, 94) and radius 47.
; PLAN: r0=305(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=94(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 94
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
