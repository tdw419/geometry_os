; DESCRIPTION: Composite: Sets a single blue pixel at (251, 231) then Creates a blue rectangular region at (99, 124) spanning 75 by 88 pixels.
; PLAN: r0=251(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=124(y), r7=75(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 124
LDI r7, 75
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
