; DESCRIPTION: Composite: Sets a single yellow pixel at (132, 149) then Places a yellow circle of radius 49 at center (99, 140).
; PLAN: r0=132(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=140(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 99
LDI r6, 140
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
