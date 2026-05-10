; DESCRIPTION: Composite: Sets a single green pixel at (57, 148) then Draws a green circle centered at (317, 97) with radius 25.
; PLAN: r0=57(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=97(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 317
LDI r6, 97
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
