; DESCRIPTION: Composite: Sets a single blue pixel at (121, 162) then Creates a green circular shape at (314, 161) with radius 29.
; PLAN: r0=121(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=161(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 161
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
