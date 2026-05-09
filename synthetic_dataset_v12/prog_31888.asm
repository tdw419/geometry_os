; DESCRIPTION: Composite: Places a yellow dot at position (189, 249) then Creates a purple circular shape at (180, 148) with radius 24.
; PLAN: r0=189(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=148(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 249
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 148
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
