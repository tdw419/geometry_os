; DESCRIPTION: Composite: Places a cyan dot at position (258, 190) then Creates a green rectangular region at (309, 132) spanning 19 by 47 pixels.
; PLAN: r0=258(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=132(y), r7=19(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 132
LDI r7, 19
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
