; DESCRIPTION: Composite: Places a cyan dot at position (274, 83) then Creates a orange rectangular region at (169, 134) spanning 49 by 54 pixels.
; PLAN: r0=274(x), r1=83(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=134(y), r7=49(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 83
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 134
LDI r7, 49
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
