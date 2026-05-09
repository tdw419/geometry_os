; DESCRIPTION: Composite: Sets a single yellow pixel at (171, 139) then Creates a cyan rectangular region at (158, 71) spanning 108 by 90 pixels.
; PLAN: r0=171(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=71(y), r7=108(width), r8=90(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 139
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 71
LDI r7, 108
LDI r8, 90
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
