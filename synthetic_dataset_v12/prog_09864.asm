; DESCRIPTION: Composite: Places a purple dot at position (102, 92) then Creates a orange rectangular region at (364, 165) spanning 107 by 63 pixels.
; PLAN: r0=102(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=165(y), r7=107(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 165
LDI r7, 107
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
