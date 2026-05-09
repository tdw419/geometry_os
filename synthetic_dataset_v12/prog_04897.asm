; DESCRIPTION: Composite: Places a green dot at position (395, 11) then Draws a white circle centered at (235, 119) with radius 29.
; PLAN: r0=395(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=119(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 119
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
