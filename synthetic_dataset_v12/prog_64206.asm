; DESCRIPTION: Composite: Sets a single green pixel at (274, 217) then Places a orange line segment connecting (212, 6) to (504, 155).
; PLAN: r0=274(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=212(x1), r6=6(y1), r7=504(x2), r8=155(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 212
LDI r6, 6
LDI r7, 504
LDI r8, 155
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
