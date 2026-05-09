; DESCRIPTION: Composite: Sets a single cyan pixel at (325, 116) then Creates a green rectangular region at (324, 83) spanning 75 by 10 pixels.
; PLAN: r0=325(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=83(y), r7=75(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 83
LDI r7, 75
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
