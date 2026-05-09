; DESCRIPTION: Composite: Sets a single purple pixel at (81, 104) then Creates a blue rectangular region at (222, 53) spanning 70 by 34 pixels.
; PLAN: r0=81(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=53(y), r7=70(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 104
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 53
LDI r7, 70
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
