; DESCRIPTION: Composite: Sets a single black pixel at (94, 242) then Creates a purple circular shape at (125, 132) with radius 63.
; PLAN: r0=94(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=132(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 125
LDI r6, 132
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
