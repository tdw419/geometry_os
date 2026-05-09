; DESCRIPTION: Composite: Sets a single yellow pixel at (400, 98) then Draws a blue circle centered at (279, 38) with radius 25.
; PLAN: r0=400(x), r1=98(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=38(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 98
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 279
LDI r6, 38
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
