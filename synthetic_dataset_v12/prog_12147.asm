; DESCRIPTION: Composite: Sets a single white pixel at (141, 87) then Creates a orange rectangular region at (96, 119) spanning 16 by 98 pixels.
; PLAN: r0=141(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=119(y), r7=16(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 119
LDI r7, 16
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
