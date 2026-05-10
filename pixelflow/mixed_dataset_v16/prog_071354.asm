; DESCRIPTION: Composite: Renders a black line between points (147, 86) and (502, 106) then Draws a purple circle centered at (306, 150) with radius 54.
; PLAN: r0=147(x1), r1=86(y1), r2=502(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=150(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 86
LDI r2, 502
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 150
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
