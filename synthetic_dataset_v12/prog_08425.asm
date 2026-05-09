; DESCRIPTION: Composite: Sets a single yellow pixel at (61, 140) then Creates a yellow rectangular region at (363, 149) spanning 100 by 48 pixels.
; PLAN: r0=61(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=149(y), r7=100(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 363
LDI r6, 149
LDI r7, 100
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
