; DESCRIPTION: Composite: Sets a single yellow pixel at (263, 22) then Creates a white rectangular region at (145, 147) spanning 10 by 78 pixels.
; PLAN: r0=263(x), r1=22(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=147(y), r7=10(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 22
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 147
LDI r7, 10
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
