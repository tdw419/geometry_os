; DESCRIPTION: Composite: Sets a single yellow pixel at (500, 33) then Draws a purple rectangle at (36, 107) with width 33 and height 86.
; PLAN: r0=500(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=107(y), r7=33(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 107
LDI r7, 33
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
