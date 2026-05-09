; DESCRIPTION: Composite: Sets a single blue pixel at (116, 148) then Creates a red rectangular region at (105, 95) spanning 75 by 71 pixels.
; PLAN: r0=116(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=95(y), r7=75(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 95
LDI r7, 75
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
