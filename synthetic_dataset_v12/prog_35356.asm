; DESCRIPTION: Composite: Sets a single green pixel at (368, 217) then Creates a magenta rectangular region at (206, 106) spanning 35 by 26 pixels.
; PLAN: r0=368(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=106(y), r7=35(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 206
LDI r6, 106
LDI r7, 35
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
