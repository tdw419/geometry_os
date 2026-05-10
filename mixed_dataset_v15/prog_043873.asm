; DESCRIPTION: Composite: Sets a single black pixel at (276, 16) then Creates a white rectangular region at (386, 76) spanning 75 by 100 pixels.
; PLAN: r0=276(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=76(y), r7=75(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 386
LDI r6, 76
LDI r7, 75
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
