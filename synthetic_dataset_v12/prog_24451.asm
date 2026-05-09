; DESCRIPTION: Composite: Renders a magenta disk with center (381, 162) and radius 46 then Sets a single blue pixel at (186, 92).
; PLAN: r0=381(x), r1=162(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 162
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
