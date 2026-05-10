; DESCRIPTION: Composite: Sets a single cyan pixel at (208, 166) then Draws a green rectangle at (289, 113) with width 118 and height 34.
; PLAN: r0=208(x), r1=166(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=113(y), r7=118(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 166
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 113
LDI r7, 118
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
