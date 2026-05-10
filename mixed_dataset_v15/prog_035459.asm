; DESCRIPTION: Composite: Sets a single purple pixel at (290, 45) then Creates a purple rectangular region at (348, 181) spanning 101 by 69 pixels.
; PLAN: r0=290(x), r1=45(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=181(y), r7=101(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 45
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 181
LDI r7, 101
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
