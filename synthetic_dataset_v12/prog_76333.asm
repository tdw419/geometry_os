; DESCRIPTION: Composite: Draws a black circle centered at (396, 141) with radius 20 then Sets a single orange pixel at (362, 198).
; PLAN: r0=396(x), r1=141(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=198(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 141
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 198
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
