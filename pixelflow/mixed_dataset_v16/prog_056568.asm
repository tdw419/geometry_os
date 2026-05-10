; DESCRIPTION: Composite: Sets a single yellow pixel at (4, 52) then Creates a orange rectangular region at (376, 21) spanning 101 by 105 pixels.
; PLAN: r0=4(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=21(y), r7=101(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 376
LDI r6, 21
LDI r7, 101
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
