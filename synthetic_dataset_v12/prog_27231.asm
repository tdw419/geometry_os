; DESCRIPTION: Composite: Sets a single red pixel at (254, 74) then Draws a magenta rectangle at (43, 83) with width 12 and height 89.
; PLAN: r0=254(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=83(y), r7=12(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 43
LDI r6, 83
LDI r7, 12
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
