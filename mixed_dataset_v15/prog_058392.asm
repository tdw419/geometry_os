; DESCRIPTION: Composite: Sets a single red pixel at (145, 109) then Creates a cyan rectangular region at (309, 16) spanning 77 by 14 pixels.
; PLAN: r0=145(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=16(y), r7=77(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 16
LDI r7, 77
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
