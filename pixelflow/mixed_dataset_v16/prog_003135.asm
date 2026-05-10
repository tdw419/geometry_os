; DESCRIPTION: Composite: Creates a magenta circular shape at (203, 190) with radius 63 then Sets a single yellow pixel at (147, 192).
; PLAN: r0=203(x), r1=190(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=192(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 190
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 192
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
