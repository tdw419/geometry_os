; DESCRIPTION: Composite: Sets a single red pixel at (478, 253) then Draws a orange rectangle at (150, 157) with width 118 and height 80.
; PLAN: r0=478(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=157(y), r7=118(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 253
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 157
LDI r7, 118
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
