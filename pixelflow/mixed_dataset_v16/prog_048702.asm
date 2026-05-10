; DESCRIPTION: Composite: Sets a single purple pixel at (22, 19) then Places a purple circle of radius 22 at center (207, 138).
; PLAN: r0=22(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=138(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 138
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
