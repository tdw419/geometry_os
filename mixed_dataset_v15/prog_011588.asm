; DESCRIPTION: Composite: Sets a single white pixel at (91, 125) then Draws a cyan rectangle at (90, 36) with width 41 and height 23.
; PLAN: r0=91(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=36(y), r7=41(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 36
LDI r7, 41
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
