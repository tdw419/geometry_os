; DESCRIPTION: Composite: Sets a single red pixel at (305, 250) then Draws a green circle centered at (228, 172) with radius 78.
; PLAN: r0=305(x), r1=250(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=172(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 250
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 172
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
