; DESCRIPTION: Composite: Sets a single magenta pixel at (31, 28) then Creates a cyan rectangular region at (363, 132) spanning 40 by 109 pixels.
; PLAN: r0=31(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=132(y), r7=40(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 132
LDI r7, 40
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
