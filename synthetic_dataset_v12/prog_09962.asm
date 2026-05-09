; DESCRIPTION: Composite: Creates a orange circular shape at (63, 107) with radius 15 then Sets a single magenta pixel at (459, 17).
; PLAN: r0=63(x), r1=107(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=17(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 107
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 17
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
