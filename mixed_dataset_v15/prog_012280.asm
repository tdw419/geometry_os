; DESCRIPTION: Composite: Places a green dot at position (109, 225) then Creates a purple circular shape at (328, 110) with radius 51.
; PLAN: r0=109(x), r1=225(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=110(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 225
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 328
LDI r6, 110
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
