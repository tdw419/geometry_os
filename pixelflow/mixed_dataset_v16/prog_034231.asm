; DESCRIPTION: Composite: Places a green dot at position (62, 159) then Draws a white line from (207, 28) to (319, 104) then Creates a magenta circular shape at (322, 190) with radius 43.
; PLAN: r0=62(x), r1=159(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=28(y1), r7=319(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=190(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 159
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 28
LDI r7, 319
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 190
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
