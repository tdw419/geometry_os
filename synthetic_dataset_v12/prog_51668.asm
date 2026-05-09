; DESCRIPTION: Composite: Places a white dot at position (147, 37) then Creates a blue circular shape at (250, 34) with radius 24.
; PLAN: r0=147(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=34(y), r7=24(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 34
LDI r7, 24
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
