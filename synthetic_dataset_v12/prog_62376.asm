; DESCRIPTION: Composite: Places a red dot at position (31, 101) then Creates a white rectangular region at (216, 97) spanning 73 by 18 pixels.
; PLAN: r0=31(x), r1=101(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=97(y), r7=73(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 101
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 97
LDI r7, 73
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
