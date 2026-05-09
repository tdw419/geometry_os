; DESCRIPTION: Composite: Sets a single blue pixel at (71, 184) then Creates a cyan rectangular region at (258, 108) spanning 117 by 115 pixels.
; PLAN: r0=71(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=108(y), r7=117(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 108
LDI r7, 117
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
