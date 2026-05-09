; DESCRIPTION: Composite: Sets a single purple pixel at (97, 193) then Creates a yellow rectangular region at (36, 133) spanning 76 by 91 pixels.
; PLAN: r0=97(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=133(y), r7=76(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 133
LDI r7, 76
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
