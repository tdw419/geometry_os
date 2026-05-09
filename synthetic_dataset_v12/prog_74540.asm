; DESCRIPTION: Composite: Places a green dot at position (181, 76) then Creates a magenta circular shape at (381, 152) with radius 57.
; PLAN: r0=181(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=152(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 381
LDI r6, 152
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
