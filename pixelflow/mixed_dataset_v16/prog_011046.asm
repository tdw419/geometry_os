; DESCRIPTION: Composite: Places a black dot at position (309, 139) then Creates a red circular shape at (350, 178) with radius 70.
; PLAN: r0=309(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=178(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 350
LDI r6, 178
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
