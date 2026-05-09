; DESCRIPTION: Composite: Places a purple dot at position (216, 165) then Creates a blue circular shape at (413, 99) with radius 74.
; PLAN: r0=216(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=99(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 99
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
