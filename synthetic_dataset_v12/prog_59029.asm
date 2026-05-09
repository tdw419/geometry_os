; DESCRIPTION: Composite: Sets a single orange pixel at (238, 47) then Draws a blue rectangle at (0, 71) with width 68 and height 106.
; PLAN: r0=238(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=71(y), r7=68(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 0
LDI r6, 71
LDI r7, 68
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
