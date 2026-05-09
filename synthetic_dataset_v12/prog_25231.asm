; DESCRIPTION: Composite: Renders a magenta disk with center (118, 188) and radius 10 then Renders a orange line between points (132, 25) and (302, 171) then Sets a single magenta pixel at (464, 178).
; PLAN: r0=118(x), r1=188(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=25(y1), r7=302(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=464(x), r11=178(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 188
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 25
LDI r7, 302
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 178
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
