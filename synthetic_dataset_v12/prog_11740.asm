; DESCRIPTION: Composite: Places a orange dot at position (332, 47) then Draws a magenta line from (282, 60) to (329, 226) then Draws a green circle centered at (85, 56) with radius 40.
; PLAN: r0=332(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=60(y1), r7=329(x2), r8=226(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=56(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 282
LDI r6, 60
LDI r7, 329
LDI r8, 226
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 56
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
