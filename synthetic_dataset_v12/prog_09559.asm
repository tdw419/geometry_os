; DESCRIPTION: Composite: Sets a single red pixel at (300, 66) then Draws a white circle centered at (136, 118) with radius 55.
; PLAN: r0=300(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=118(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 136
LDI r6, 118
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
