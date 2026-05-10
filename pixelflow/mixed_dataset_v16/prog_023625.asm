; DESCRIPTION: Composite: Sets a single magenta pixel at (20, 101) then Places a magenta line segment connecting (197, 79) to (380, 125) then Draws a blue circle centered at (65, 155) with radius 48.
; PLAN: r0=20(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=197(x1), r6=79(y1), r7=380(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=155(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 79
LDI r7, 380
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 155
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
