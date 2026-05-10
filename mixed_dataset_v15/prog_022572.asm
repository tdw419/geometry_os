; DESCRIPTION: Composite: Sets a single blue pixel at (246, 208) then Draws a green rectangle at (425, 113) with width 29 and height 68.
; PLAN: r0=246(x), r1=208(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=113(y), r7=29(width), r8=68(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 208
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 113
LDI r7, 29
LDI r8, 68
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
