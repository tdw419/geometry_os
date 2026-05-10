; DESCRIPTION: Composite: Sets a single purple pixel at (235, 101) then Renders a blue disk with center (225, 142) and radius 61.
; PLAN: r0=235(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=142(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 142
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
