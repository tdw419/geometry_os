; DESCRIPTION: Composite: Sets a single magenta pixel at (118, 5) then Creates a blue rectangular region at (379, 4) spanning 31 by 23 pixels.
; PLAN: r0=118(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=4(y), r7=31(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 4
LDI r7, 31
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
