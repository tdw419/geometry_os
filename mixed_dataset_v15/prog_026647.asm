; DESCRIPTION: Composite: Sets a single black pixel at (383, 42) then Draws a orange rectangle at (398, 147) with width 12 and height 41.
; PLAN: r0=383(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=147(y), r7=12(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 398
LDI r6, 147
LDI r7, 12
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
