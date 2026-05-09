; DESCRIPTION: Composite: Places a magenta dot at position (118, 150) then Creates a blue rectangular region at (83, 23) spanning 45 by 116 pixels.
; PLAN: r0=118(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=23(y), r7=45(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 23
LDI r7, 45
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
