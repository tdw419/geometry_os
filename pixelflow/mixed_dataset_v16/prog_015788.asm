; DESCRIPTION: Composite: Sets a single magenta pixel at (127, 83) then Creates a white rectangular region at (343, 21) spanning 85 by 20 pixels.
; PLAN: r0=127(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=21(y), r7=85(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 83
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 21
LDI r7, 85
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
