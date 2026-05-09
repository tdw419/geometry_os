; DESCRIPTION: Composite: Sets a single orange pixel at (462, 35) then Draws a red rectangle at (440, 2) with width 64 and height 44.
; PLAN: r0=462(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=2(y), r7=64(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 440
LDI r6, 2
LDI r7, 64
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
