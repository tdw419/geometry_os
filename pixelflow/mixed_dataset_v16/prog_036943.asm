; DESCRIPTION: Composite: Places a orange dot at position (19, 141) then Places a blue line segment connecting (248, 25) to (472, 229) then Places a magenta circle of radius 73 at center (309, 146).
; PLAN: r0=19(x), r1=141(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=248(x1), r6=25(y1), r7=472(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=146(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 141
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 248
LDI r6, 25
LDI r7, 472
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 146
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
