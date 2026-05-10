; DESCRIPTION: Composite: Sets a single cyan pixel at (425, 13) then Creates a black rectangular region at (191, 83) spanning 14 by 79 pixels.
; PLAN: r0=425(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=83(y), r7=14(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 83
LDI r7, 14
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
