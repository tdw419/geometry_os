; DESCRIPTION: Composite: Sets a single blue pixel at (159, 93) then Creates a purple rectangular region at (53, 185) spanning 106 by 21 pixels.
; PLAN: r0=159(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=185(y), r7=106(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 185
LDI r7, 106
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
