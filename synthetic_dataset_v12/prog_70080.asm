; DESCRIPTION: Composite: Places a magenta dot at position (260, 87) then Places a purple circle of radius 73 at center (357, 118).
; PLAN: r0=260(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=118(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 87
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 118
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
