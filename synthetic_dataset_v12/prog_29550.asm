; DESCRIPTION: Composite: Sets a single white pixel at (405, 62) then Creates a black rectangular region at (126, 199) spanning 106 by 26 pixels.
; PLAN: r0=405(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=199(y), r7=106(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 199
LDI r7, 106
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
