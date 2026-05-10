; DESCRIPTION: Composite: Sets a single black pixel at (405, 11) then Draws a orange rectangle at (267, 49) with width 18 and height 53.
; PLAN: r0=405(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=49(y), r7=18(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 49
LDI r7, 18
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
