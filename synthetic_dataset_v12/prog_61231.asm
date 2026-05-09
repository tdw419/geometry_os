; DESCRIPTION: Composite: Sets a single yellow pixel at (165, 95) then Draws a orange rectangle at (7, 119) with width 61 and height 22.
; PLAN: r0=165(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=119(y), r7=61(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 7
LDI r6, 119
LDI r7, 61
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
