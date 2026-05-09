; DESCRIPTION: Composite: Places a magenta dot at position (97, 144) then Creates a yellow circular shape at (145, 52) with radius 28.
; PLAN: r0=97(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=52(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 52
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
