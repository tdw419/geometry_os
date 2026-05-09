; DESCRIPTION: Composite: Places a orange dot at position (381, 83) then Creates a black rectangular region at (92, 38) spanning 89 by 70 pixels.
; PLAN: r0=381(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=38(y), r7=89(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 92
LDI r6, 38
LDI r7, 89
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
