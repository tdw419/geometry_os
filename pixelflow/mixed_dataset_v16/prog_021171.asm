; DESCRIPTION: Composite: Renders a cyan line between points (311, 176) and (404, 15) then Creates a white rectangular region at (351, 67) spanning 89 by 58 pixels then Sets a single magenta pixel at (208, 88).
; PLAN: r0=311(x1), r1=176(y1), r2=404(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=67(y), r7=89(width), r8=58(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=88(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 176
LDI r2, 404
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 67
LDI r7, 89
LDI r8, 58
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 88
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
