; DESCRIPTION: Composite: Places a green dot at position (170, 15) then Creates a magenta circular shape at (436, 137) with radius 32.
; PLAN: r0=170(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=137(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 436
LDI r6, 137
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
