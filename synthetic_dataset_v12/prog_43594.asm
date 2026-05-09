; DESCRIPTION: Composite: Sets a single blue pixel at (439, 177) then Renders a blue line between points (355, 146) and (323, 226) then Draws a red circle centered at (175, 67) with radius 63.
; PLAN: r0=439(x), r1=177(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=355(x1), r6=146(y1), r7=323(x2), r8=226(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=67(y), r12=63(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 439
LDI r1, 177
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 146
LDI r7, 323
LDI r8, 226
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 67
LDI r12, 63
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
