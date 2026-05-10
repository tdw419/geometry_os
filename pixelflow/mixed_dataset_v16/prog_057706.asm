; DESCRIPTION: Composite: Sets a single magenta pixel at (61, 246) then Creates a orange rectangular region at (335, 21) spanning 31 by 101 pixels.
; PLAN: r0=61(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=21(y), r7=31(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 21
LDI r7, 31
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
