; DESCRIPTION: Composite: Sets a single white pixel at (489, 49) then Creates a magenta rectangular region at (12, 81) spanning 45 by 118 pixels.
; PLAN: r0=489(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=81(y), r7=45(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 81
LDI r7, 45
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
