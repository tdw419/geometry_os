; DESCRIPTION: Composite: Sets a single red pixel at (248, 102) then Draws a yellow circle centered at (387, 72) with radius 53.
; PLAN: r0=248(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=72(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 387
LDI r6, 72
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
