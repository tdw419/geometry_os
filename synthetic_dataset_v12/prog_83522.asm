; DESCRIPTION: Composite: Sets a single black pixel at (463, 152) then Creates a black rectangular region at (83, 89) spanning 34 by 82 pixels.
; PLAN: r0=463(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=89(y), r7=34(width), r8=82(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 83
LDI r6, 89
LDI r7, 34
LDI r8, 82
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
