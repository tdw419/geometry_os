; DESCRIPTION: Composite: Sets a single red pixel at (454, 169) then Draws a yellow line from (140, 123) to (123, 120) then Renders a magenta disk with center (249, 125) and radius 78.
; PLAN: r0=454(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=140(x1), r6=123(y1), r7=123(x2), r8=120(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=125(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 169
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 140
LDI r6, 123
LDI r7, 123
LDI r8, 120
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 125
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
