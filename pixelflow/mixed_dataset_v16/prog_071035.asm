; DESCRIPTION: Composite: Places a black dot at position (207, 206) then Renders a yellow line between points (432, 30) and (386, 134) then Draws a green circle centered at (414, 161) with radius 16.
; PLAN: r0=207(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=432(x1), r6=30(y1), r7=386(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=161(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 30
LDI r7, 386
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 161
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
