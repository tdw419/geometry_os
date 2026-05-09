; DESCRIPTION: Composite: Sets a single purple pixel at (145, 139) then Renders a white line between points (439, 8) and (416, 167) then Creates a magenta circular shape at (252, 174) with radius 78.
; PLAN: r0=145(x), r1=139(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=8(y1), r7=416(x2), r8=167(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=174(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 139
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 8
LDI r7, 416
LDI r8, 167
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 174
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
