; DESCRIPTION: Composite: Renders a magenta disk with center (229, 188) and radius 12 then Sets a single blue pixel at (121, 37) then Draws a green line from (430, 183) to (137, 134).
; PLAN: r0=229(x), r1=188(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=37(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=430(x1), r11=183(y1), r12=137(x2), r13=134(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 188
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 37
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 430
LDI r11, 183
LDI r12, 137
LDI r13, 134
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
