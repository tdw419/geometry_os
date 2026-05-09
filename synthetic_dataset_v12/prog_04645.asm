; DESCRIPTION: Composite: Draws a black circle centered at (176, 127) with radius 27 then Sets a single blue pixel at (325, 228).
; PLAN: r0=176(x), r1=127(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=228(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 127
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 228
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
