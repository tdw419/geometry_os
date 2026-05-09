; DESCRIPTION: Composite: Sets a single red pixel at (294, 93) then Draws a blue rectangle at (266, 34) with width 103 and height 75.
; PLAN: r0=294(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=34(y), r7=103(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 266
LDI r6, 34
LDI r7, 103
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
