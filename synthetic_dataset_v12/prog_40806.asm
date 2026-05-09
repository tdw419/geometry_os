; DESCRIPTION: Composite: Sets a single green pixel at (396, 0) then Draws a blue circle centered at (176, 111) with radius 78.
; PLAN: r0=396(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=111(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 111
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
