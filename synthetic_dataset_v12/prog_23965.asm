; DESCRIPTION: Composite: Sets a single black pixel at (135, 23) then Creates a orange rectangular region at (314, 109) spanning 25 by 108 pixels.
; PLAN: r0=135(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=109(y), r7=25(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 109
LDI r7, 25
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
