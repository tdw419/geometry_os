; DESCRIPTION: Composite: Draws a magenta circle centered at (120, 117) with radius 54 then Sets a single blue pixel at (162, 200) then Renders a black line between points (41, 45) and (143, 131).
; PLAN: r0=120(x), r1=117(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=200(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=41(x1), r11=45(y1), r12=143(x2), r13=131(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 117
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 200
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 41
LDI r11, 45
LDI r12, 143
LDI r13, 131
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
