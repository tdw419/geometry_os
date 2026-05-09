; DESCRIPTION: Composite: Sets a single magenta pixel at (379, 177) then Creates a yellow rectangular region at (391, 205) spanning 79 by 26 pixels.
; PLAN: r0=379(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=205(y), r7=79(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 205
LDI r7, 79
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
