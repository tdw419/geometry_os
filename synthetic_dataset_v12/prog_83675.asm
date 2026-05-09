; DESCRIPTION: Composite: Places a white dot at position (450, 156) then Places a green line segment connecting (14, 232) to (96, 225) then Draws a magenta circle centered at (264, 161) with radius 78.
; PLAN: r0=450(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=232(y1), r7=96(x2), r8=225(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=161(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 232
LDI r7, 96
LDI r8, 225
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 161
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
