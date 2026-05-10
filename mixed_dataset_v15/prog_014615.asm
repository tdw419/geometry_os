; DESCRIPTION: Composite: Sets a single red pixel at (480, 183) then Draws a white rectangle at (250, 12) with width 36 and height 21.
; PLAN: r0=480(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=12(y), r7=36(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 250
LDI r6, 12
LDI r7, 36
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
