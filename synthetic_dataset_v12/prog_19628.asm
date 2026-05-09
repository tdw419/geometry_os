; DESCRIPTION: Composite: Sets a single yellow pixel at (498, 97) then Creates a blue rectangular region at (111, 198) spanning 115 by 31 pixels.
; PLAN: r0=498(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=198(y), r7=115(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 111
LDI r6, 198
LDI r7, 115
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
