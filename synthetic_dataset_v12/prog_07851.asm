; DESCRIPTION: Composite: Sets a single green pixel at (237, 186) then Creates a yellow circular shape at (107, 138) with radius 69.
; PLAN: r0=237(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=138(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 237
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 107
LDI r6, 138
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
