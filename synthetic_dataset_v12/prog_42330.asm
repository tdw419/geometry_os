; DESCRIPTION: Composite: Sets a single blue pixel at (382, 8) then Renders a magenta line between points (438, 112) and (103, 231) then Draws a red circle centered at (353, 121) with radius 29.
; PLAN: r0=382(x), r1=8(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=112(y1), r7=103(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=121(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 8
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 112
LDI r7, 103
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 121
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
