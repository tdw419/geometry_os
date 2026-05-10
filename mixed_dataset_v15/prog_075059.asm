; DESCRIPTION: Composite: Sets a single orange pixel at (198, 95) then Creates a magenta rectangular region at (97, 148) spanning 112 by 87 pixels.
; PLAN: r0=198(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=148(y), r7=112(width), r8=87(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 97
LDI r6, 148
LDI r7, 112
LDI r8, 87
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
