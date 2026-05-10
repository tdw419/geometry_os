; DESCRIPTION: Composite: Sets a single yellow pixel at (370, 79) then Draws a blue rectangle at (62, 177) with width 41 and height 14.
; PLAN: r0=370(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=177(y), r7=41(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 62
LDI r6, 177
LDI r7, 41
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
