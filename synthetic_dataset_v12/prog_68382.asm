; DESCRIPTION: Composite: Sets a single orange pixel at (402, 81) then Creates a white rectangular region at (337, 36) spanning 83 by 97 pixels.
; PLAN: r0=402(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=36(y), r7=83(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 337
LDI r6, 36
LDI r7, 83
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
