; DESCRIPTION: Composite: Sets a single cyan pixel at (352, 186) then Creates a white rectangular region at (322, 90) spanning 115 by 59 pixels.
; PLAN: r0=352(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=90(y), r7=115(width), r8=59(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 90
LDI r7, 115
LDI r8, 59
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
