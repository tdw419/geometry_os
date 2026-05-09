; DESCRIPTION: Composite: Draws a blue line from (393, 103) to (163, 172) then Renders a magenta disk with center (452, 158) and radius 42 then Sets a single red pixel at (441, 75).
; PLAN: r0=393(x1), r1=103(y1), r2=163(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=158(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=75(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 103
LDI r2, 163
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 158
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 75
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
