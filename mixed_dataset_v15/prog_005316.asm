; DESCRIPTION: Composite: Places a magenta dot at position (338, 186) then Places a white line segment connecting (167, 200) to (327, 107) then Draws a green circle centered at (155, 178) with radius 46.
; PLAN: r0=338(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=200(y1), r7=327(x2), r8=107(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=178(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 200
LDI r7, 327
LDI r8, 107
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 178
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
