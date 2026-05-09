; DESCRIPTION: Composite: Places a blue circle of radius 53 at center (249, 200) then Places a purple dot at position (106, 162).
; PLAN: r0=249(x), r1=200(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=162(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 200
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 162
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
