; DESCRIPTION: Composite: Sets a single yellow pixel at (454, 46) then Creates a yellow rectangular region at (166, 168) spanning 101 by 87 pixels.
; PLAN: r0=454(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=168(y), r7=101(width), r8=87(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 168
LDI r7, 101
LDI r8, 87
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
