; DESCRIPTION: Composite: Sets a single cyan pixel at (218, 107) then Creates a red rectangular region at (278, 14) spanning 40 by 87 pixels.
; PLAN: r0=218(x), r1=107(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=14(y), r7=40(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 107
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 14
LDI r7, 40
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
