; DESCRIPTION: Composite: Sets a single purple pixel at (161, 52) then Draws a purple circle centered at (237, 204) with radius 29.
; PLAN: r0=161(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=204(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 204
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
