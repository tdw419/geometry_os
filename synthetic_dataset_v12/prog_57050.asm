; DESCRIPTION: Composite: Sets a single white pixel at (267, 63) then Draws a green circle centered at (311, 174) with radius 38.
; PLAN: r0=267(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=174(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 174
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
