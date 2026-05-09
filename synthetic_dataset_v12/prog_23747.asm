; DESCRIPTION: Composite: Places a red dot at position (112, 205) then Creates a orange rectangular region at (69, 45) spanning 82 by 106 pixels.
; PLAN: r0=112(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=45(y), r7=82(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 69
LDI r6, 45
LDI r7, 82
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
