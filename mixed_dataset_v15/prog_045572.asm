; DESCRIPTION: Composite: Draws a white circle centered at (390, 107) with radius 27 then Sets a single black pixel at (127, 205).
; PLAN: r0=390(x), r1=107(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=205(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 107
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 205
LDI r7, 0x000000
PSET r5, r6, r7
HALT
