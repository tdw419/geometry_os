; DESCRIPTION: Composite: Sets a single yellow pixel at (235, 7) then Creates a green rectangular region at (169, 43) spanning 66 by 67 pixels.
; PLAN: r0=235(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=43(y), r7=66(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 43
LDI r7, 66
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
