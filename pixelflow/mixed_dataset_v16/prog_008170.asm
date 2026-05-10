; DESCRIPTION: Composite: Sets a single black pixel at (26, 188) then Draws a red circle centered at (240, 57) with radius 30.
; PLAN: r0=26(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=57(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 240
LDI r6, 57
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
