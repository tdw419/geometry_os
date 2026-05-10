; DESCRIPTION: Composite: Places a orange line segment connecting (414, 11) to (199, 215) then Creates a magenta circular shape at (335, 87) with radius 37 then Places a black dot at position (487, 9).
; PLAN: r0=414(x1), r1=11(y1), r2=199(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=87(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=487(x), r11=9(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 11
LDI r2, 199
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 87
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 487
LDI r11, 9
LDI r12, 0x000000
PSET r10, r11, r12
HALT
