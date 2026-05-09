; DESCRIPTION: Composite: Sets a single yellow pixel at (85, 194) then Renders a yellow disk with center (179, 188) and radius 35.
; PLAN: r0=85(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=188(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 179
LDI r6, 188
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
